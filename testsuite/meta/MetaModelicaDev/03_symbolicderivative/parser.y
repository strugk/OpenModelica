%{
#include <stdio.h>

#define YYSTYPE void*
void* absyntree;

int yyerror(char *s)
{
  extern int yylineno;
  fprintf(stderr,"Syntax error at or near line %d.\n",yylineno);
  exit(1);
}

int yywrap()
{
  return 1;
}

#ifdef RML
#include "SymbolicDerivative.h"
#include "yacclib.h"
#else
#include "meta_modelica.h"
void* getAST()
{
  return absyntree;
}

/* Exp */
const char* SymbolicDerivative_INT__desc__fields[] = {"integer"};
struct record_description SymbolicDerivative_INTEGER__desc = {
    "SymbolicDerivative_INT",
    "Exp.INT",
    SymbolicDerivative_INT__desc__fields
};
const char* SymbolicDerivative_ADD__desc__fields[] = {"exp1","exp2"};
struct record_description SymbolicDerivative_ADD__desc = {
    "SymbolicDerivative_ADD",
    "Exp.ADD",
    SymbolicDerivative_ADD__desc__fields
};
const char* SymbolicDerivative_SUB__desc__fields[] = {"exp1","exp2"};
struct record_description SymbolicDerivative_SUB__desc = {
    "SymbolicDerivative_SUB",
    "Exp.SUB",
    SymbolicDerivative_SUB__desc__fields
};
const char* SymbolicDerivative_MUL__desc__fields[] = {"exp1","exp2"};
struct record_description SymbolicDerivative_MUL__desc = {
    "SymbolicDerivative_MUL",
    "Exp.MUL",
    SymbolicDerivative_MUL__desc__fields
};
const char* SymbolicDerivative_DIV__desc__fields[] = {"exp1","exp2"};
struct record_description SymbolicDerivative_DIV__desc = {
    "SymbolicDerivative_DIV",
    "Exp.DIV",
    SymbolicDerivative_DIV__desc__fields
};
const char* SymbolicDerivative_NEG__desc__fields[] = {"exp"};
struct record_description SymbolicDerivative_NEG__desc = {
    "SymbolicDerivative_NEG",
    "Exp.NEG",
    SymbolicDerivative_NEG__desc__fields
};
const char* SymbolicDerivative_IDENT__desc__fields[] = {"id"};
struct record_description SymbolicDerivative_IDENT__desc = {
    "SymbolicDerivative_IDENT",
    "Exp.IDENT",
    SymbolicDerivative_IDENT__desc__fields
};
const char* SymbolicDerivative_CALL__desc__fields[] = {"id","args"};
struct record_description SymbolicDerivative_CALL__desc = {
    "SymbolicDerivative_CALL",
    "Exp.CALL",
    SymbolicDerivative_CALL__desc__fields
};

#define SymbolicDerivative__INTEGER(X1) (mmc_mk_box2(3,&SymbolicDerivative_INTEGER__desc,(X1)))
#define SymbolicDerivative__ADD(X1,X2) (mmc_mk_box3(4,&SymbolicDerivative_ADD__desc,(X1),(X2)))
#define SymbolicDerivative__SUB(X1,X2) (mmc_mk_box3(5,&SymbolicDerivative_SUB__desc,(X1),(X2)))
#define SymbolicDerivative__MUL(X1,X2) (mmc_mk_box3(6,&SymbolicDerivative_MUL__desc,(X1),(X2)))
#define SymbolicDerivative__DIV(X1,X2) (mmc_mk_box3(7,&SymbolicDerivative_DIV__desc,(X1),(X2)))
#define SymbolicDerivative__NEG(X1) (mmc_mk_box2(8,&SymbolicDerivative_NEG__desc,(X1)))
#define SymbolicDerivative__IDENT(X1) (mmc_mk_box2(9,&SymbolicDerivative_IDENT__desc,(X1)))
#define SymbolicDerivative__CALL(X1,X2) (mmc_mk_box3(10,&SymbolicDerivative_CALL__desc,(X1),(X2)))
#endif

%}

%token T_COMMA
%token T_ASSIGN
%token T_IDENT
%token T_INTCONST
%token T_REALCONST
%token T_LPAREN T_RPAREN
%token T_ADD
%token T_SUB
%token T_MUL
%token T_DIV
%token T_GARBAGE

%token T_ERR

%%

/* Yacc BNF grammar */

program         : expression
                        { absyntree = $1; }

expression      :  term
                        { $$ = $1;}
                |  expression  T_ADD  term
                        { $$ = (void*) SymbolicDerivative__ADD($1, $3);}
                |  expression  T_SUB  term
                        { $$ = (void*) SymbolicDerivative__SUB($1, $3);}

term            :  u_element
                        { $$ = $1;}
                |  term  T_MUL u_element
                        { $$ = (void*) SymbolicDerivative__MUL($1, $3);}
                |  term  T_DIV u_element
                        { $$ = (void*) SymbolicDerivative__DIV($1, $3);}

u_element       :  element
                        { $$ = $1;}
                |  T_SUB element
                        { $$ = (void*) SymbolicDerivative__NEG($2);}

element         :  T_INTCONST
                        { $$ = (void*) SymbolicDerivative__INT($1);}
                |  T_IDENT T_LPAREN call_args T_RPAREN
                        { $$ = (void*) SymbolicDerivative__CALL($1,$3);}
                |  T_IDENT
                        { $$ = (void*) SymbolicDerivative__IDENT($1);}
                |  T_LPAREN  expression  T_RPAREN
                        { $$ = $2;}

call_args       :  expression
                        { $$ = (void*) mmc_mk_cons($1,mmc_mk_nil());}
                |  expression T_COMMA call_args
                        { $$ = (void*) mmc_mk_cons($1,$3);}

