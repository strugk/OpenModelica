encapsulated package SimCodeDump

public import Tpl;

public import SimCode;
public import BackendDAE;
public import System;
public import Absyn;
public import DAE;
public import ClassInf;
public import SCode;
public import Util;
public import ComponentReference;
public import Expression;
public import ExpressionDump;
public import RTOpts;
public import Settings;
public import Patternm;
public import Error;
public import Values;
public import ValuesUtil;
public import BackendQSS;
public import DAEDump;
public import SimCodeC;

public function dumpSimCode
  input Tpl.Text in_txt;
  input SimCode.SimCode in_a_code;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_code)
    local
      Tpl.Text txt;
      list<SimCode.SimEqSystem> i_sc_allEquations;
      list<SimCode.SimVar> i_vars_constVars;
      list<SimCode.SimVar> i_vars_jacobianVars;
      list<SimCode.SimVar> i_vars_extObjVars;
      list<SimCode.SimVar> i_vars_stringAliasVars;
      list<SimCode.SimVar> i_vars_stringParamVars;
      list<SimCode.SimVar> i_vars_stringAlgVars;
      list<SimCode.SimVar> i_vars_boolParamVars;
      list<SimCode.SimVar> i_vars_intParamVars;
      list<SimCode.SimVar> i_vars_paramVars;
      list<SimCode.SimVar> i_vars_boolAliasVars;
      list<SimCode.SimVar> i_vars_intAliasVars;
      list<SimCode.SimVar> i_vars_aliasVars;
      list<SimCode.SimVar> i_vars_outputVars;
      list<SimCode.SimVar> i_vars_inputVars;
      list<SimCode.SimVar> i_vars_boolAlgVars;
      list<SimCode.SimVar> i_vars_intAlgVars;
      list<SimCode.SimVar> i_vars_algVars;
      list<SimCode.SimVar> i_vars_derivativeVars;
      list<SimCode.SimVar> i_vars_stateVars;
      Absyn.Path i_mi_name;

    case ( txt,
           SimCode.SIMCODE(modelInfo = SimCode.MODELINFO(vars = SimCode.SIMVARS(stateVars = i_vars_stateVars, derivativeVars = i_vars_derivativeVars, algVars = i_vars_algVars, intAlgVars = i_vars_intAlgVars, boolAlgVars = i_vars_boolAlgVars, inputVars = i_vars_inputVars, outputVars = i_vars_outputVars, aliasVars = i_vars_aliasVars, intAliasVars = i_vars_intAliasVars, boolAliasVars = i_vars_boolAliasVars, paramVars = i_vars_paramVars, intParamVars = i_vars_intParamVars, boolParamVars = i_vars_boolParamVars, stringAlgVars = i_vars_stringAlgVars, stringParamVars = i_vars_stringParamVars, stringAliasVars = i_vars_stringAliasVars, extObjVars = i_vars_extObjVars, jacobianVars = i_vars_jacobianVars, constVars = i_vars_constVars), name = i_mi_name), allEquations = i_sc_allEquations) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SimCode: "));
        txt = SimCodeC.dotPath(txt, i_mi_name);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_stateVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_derivativeVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_algVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_intAlgVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_boolAlgVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_inputVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_outputVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_aliasVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_intAliasVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_boolAliasVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_paramVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_intParamVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_boolParamVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_stringAlgVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_stringParamVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_stringAliasVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_extObjVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_jacobianVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpVars(txt, i_vars_constVars);
        txt = Tpl.softNewLine(txt);
        txt = dumpEqs(txt, i_sc_allEquations);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dumpSimCode;

protected function lm_23
  input Tpl.Text in_txt;
  input list<SimCode.SimVar> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimVar> rest;
      SimCode.AliasVariable i_v_aliasvar;
      String i_v_comment;
      DAE.ComponentRef i_v_name;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SimCode.SIMVAR(name = i_v_name, comment = i_v_comment, aliasvar = i_v_aliasvar) :: rest )
      equation
        txt = SimCodeC.crefStr(txt, i_v_name);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = Tpl.writeStr(txt, i_v_comment);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" "));
        txt = dumpAlias(txt, i_v_aliasvar);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = lm_23(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_23(txt, rest);
      then txt;
  end matchcontinue;
end lm_23;

public function dumpVars
  input Tpl.Text txt;
  input list<SimCode.SimVar> a_vars;

  output Tpl.Text out_txt;
algorithm
  out_txt := lm_23(txt, a_vars);
end dumpVars;

public function dumpAlias
  input Tpl.Text in_txt;
  input SimCode.AliasVariable in_a_alias;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_alias)
    local
      Tpl.Text txt;
      DAE.ComponentRef i_varName;

    case ( txt,
           SimCode.ALIAS(varName = i_varName) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("alias of "));
        txt = SimCodeC.crefStr(txt, i_varName);
      then txt;

    case ( txt,
           SimCode.NEGATEDALIAS(varName = i_varName) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("alias of -"));
        txt = SimCodeC.crefStr(txt, i_varName);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dumpAlias;

protected function lm_26
  input Tpl.Text in_txt;
  input list<DAE.Statement> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<DAE.Statement> rest;
      DAE.Statement i_stmt;
      String ret_0;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_stmt :: rest )
      equation
        ret_0 = DAEDump.ppStmtStr(i_stmt, 2);
        txt = Tpl.writeStr(txt, ret_0);
        txt = lm_26(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_26(txt, rest);
      then txt;
  end matchcontinue;
end lm_26;

protected function fun_27
  input Tpl.Text in_txt;
  input SimCode.SimEqSystem in_a_eq;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_eq)
    local
      Tpl.Text txt;
      list<DAE.Statement> i_e_statements;
      DAE.ElementSource i_e_source;
      DAE.Exp i_e_exp;
      DAE.ComponentRef i_e_cref;
      String ret_0;

    case ( txt,
           SimCode.SES_RESIDUAL(exp = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("RESIDUAL"));
      then txt;

    case ( txt,
           SimCode.SES_SIMPLE_ASSIGN(cref = i_e_cref, exp = i_e_exp, source = i_e_source) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("eq: "));
        txt = SimCodeC.crefStr(txt, i_e_cref);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(" = "));
        ret_0 = ExpressionDump.printExpStr(i_e_exp);
        txt = Tpl.writeStr(txt, ret_0);
        txt = Tpl.writeTok(txt, Tpl.ST_LINE(";\n"));
        txt = Tpl.pushBlock(txt, Tpl.BT_INDENT(2));
        txt = dumpElementSource(txt, i_e_source);
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
        txt = Tpl.popBlock(txt);
      then txt;

    case ( txt,
           SimCode.SES_ARRAY_CALL_ASSIGN(componentRef = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SES_ARRAY_CALL_ASSIGN"));
      then txt;

    case ( txt,
           SimCode.SES_ALGORITHM(statements = {}) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("empty algorithm"));
        txt = Tpl.writeTok(txt, Tpl.ST_NEW_LINE());
      then txt;

    case ( txt,
           SimCode.SES_ALGORITHM(statements = i_e_statements) )
      equation
        txt = lm_26(txt, i_e_statements);
      then txt;

    case ( txt,
           SimCode.SES_LINEAR(index = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SES_LINEAR"));
      then txt;

    case ( txt,
           SimCode.SES_NONLINEAR(index = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SES_NONLINEAR"));
      then txt;

    case ( txt,
           SimCode.SES_MIXED(index = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SES_MIXED"));
      then txt;

    case ( txt,
           SimCode.SES_WHEN(left = _) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SES_WHEN"));
      then txt;

    case ( txt,
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("UNKNOWN"));
      then txt;
  end matchcontinue;
end fun_27;

protected function lm_28
  input Tpl.Text in_txt;
  input list<SimCode.SimEqSystem> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<SimCode.SimEqSystem> rest;
      SimCode.SimEqSystem i_eq;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_eq :: rest )
      equation
        txt = fun_27(txt, i_eq);
        txt = lm_28(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_28(txt, rest);
      then txt;
  end matchcontinue;
end lm_28;

public function dumpEqs
  input Tpl.Text txt;
  input list<SimCode.SimEqSystem> a_eqs;

  output Tpl.Text out_txt;
algorithm
  out_txt := lm_28(txt, a_eqs);
end dumpEqs;

public function dumpWithin
  input Tpl.Text in_txt;
  input Absyn.Within in_a_w;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_w)
    local
      Tpl.Text txt;
      Absyn.Path i_path;

    case ( txt,
           Absyn.TOP() )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("within ;"));
      then txt;

    case ( txt,
           Absyn.WITHIN(path = i_path) )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("within "));
        txt = SimCodeC.dotPath(txt, i_path);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING(";"));
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dumpWithin;

protected function lm_31
  input Tpl.Text in_txt;
  input list<Absyn.Within> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<Absyn.Within> rest;
      Absyn.Within i_w;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           i_w :: rest )
      equation
        txt = dumpWithin(txt, i_w);
        txt = lm_31(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_31(txt, rest);
      then txt;
  end matchcontinue;
end lm_31;

protected function lm_32
  input Tpl.Text in_txt;
  input list<Option<DAE.ComponentRef>> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<Option<DAE.ComponentRef>> rest;
      DAE.ComponentRef i_cr;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           SOME(i_cr) :: rest )
      equation
        txt = SimCodeC.crefStr(txt, i_cr);
        txt = lm_32(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_32(txt, rest);
      then txt;
  end matchcontinue;
end lm_32;

protected function lm_33
  input Tpl.Text in_txt;
  input list<Option<tuple<DAE.ComponentRef, DAE.ComponentRef>>> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<Option<tuple<DAE.ComponentRef, DAE.ComponentRef>>> rest;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("w"));
        txt = lm_33(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_33(txt, rest);
      then txt;
  end matchcontinue;
end lm_33;

protected function lm_34
  input Tpl.Text in_txt;
  input list<Absyn.Path> in_items;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items)
    local
      Tpl.Text txt;
      list<Absyn.Path> rest;

    case ( txt,
           {} )
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("w"));
        txt = lm_34(txt, rest);
      then txt;

    case ( txt,
           _ :: rest )
      equation
        txt = lm_34(txt, rest);
      then txt;
  end matchcontinue;
end lm_34;

protected function lm_35
  input Tpl.Text in_txt;
  input list<DAE.SymbolicOperation> in_items;
  input Absyn.Info in_a_s_info;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_items, in_a_s_info)
    local
      Tpl.Text txt;
      list<DAE.SymbolicOperation> rest;
      Absyn.Info a_s_info;
      DAE.SymbolicOperation i_op;

    case ( txt,
           {},
           _ )
      then txt;

    case ( txt,
           i_op :: rest,
           a_s_info )
      equation
        txt = dumpOperation(txt, i_op, a_s_info);
        txt = lm_35(txt, rest, a_s_info);
      then txt;

    case ( txt,
           _ :: rest,
           a_s_info )
      equation
        txt = lm_35(txt, rest, a_s_info);
      then txt;
  end matchcontinue;
end lm_35;

public function dumpElementSource
  input Tpl.Text in_txt;
  input DAE.ElementSource in_a_source;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_source)
    local
      Tpl.Text txt;
      list<DAE.SymbolicOperation> i_s_operations;
      list<Absyn.Path> i_s_typeLst;
      list<Option<tuple<DAE.ComponentRef, DAE.ComponentRef>>> i_s_connectEquationOptLst;
      list<Option<DAE.ComponentRef>> i_s_instanceOptLst;
      list<Absyn.Within> i_s_partOfLst;
      Absyn.Info i_s_info;
      String ret_0;

    case ( txt,
           DAE.SOURCE(info = i_s_info, partOfLst = i_s_partOfLst, instanceOptLst = i_s_instanceOptLst, connectEquationOptLst = i_s_connectEquationOptLst, typeLst = i_s_typeLst, operations = i_s_operations) )
      equation
        ret_0 = Error.infoStr(i_s_info);
        txt = Tpl.writeStr(txt, ret_0);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("partOfLst: "));
        txt = lm_31(txt, i_s_partOfLst);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("instanceOptLst: "));
        txt = lm_32(txt, i_s_instanceOptLst);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("connectEquationOptLst: "));
        txt = lm_33(txt, i_s_connectEquationOptLst);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("typeLst: "));
        txt = lm_34(txt, i_s_typeLst);
        txt = Tpl.softNewLine(txt);
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("operations: "));
        txt = lm_35(txt, i_s_operations, i_s_info);
      then txt;

    case ( txt,
           _ )
      then txt;
  end matchcontinue;
end dumpElementSource;

public function dumpOperation
  input Tpl.Text in_txt;
  input DAE.SymbolicOperation in_a_op;
  input Absyn.Info in_a_info;

  output Tpl.Text out_txt;
algorithm
  out_txt :=
  matchcontinue(in_txt, in_a_op, in_a_info)
    local
      Tpl.Text txt;
      Absyn.Info a_info;

    case ( txt,
           DAE.SIMPLIFY(before = _),
           _ )
      equation
        txt = Tpl.writeTok(txt, Tpl.ST_STRING("SIMPLIFY!"));
      then txt;

    case ( txt,
           _,
           a_info )
      equation
        Tpl.addSourceTemplateError("Unknown operation", a_info);
      then txt;
  end matchcontinue;
end dumpOperation;

end SimCodeDump;