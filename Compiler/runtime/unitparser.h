/*
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-2009, Link�pings University,
 * Department of Computer and Information Science,
 * SE-58183 Link�ping, Sweden.
 *
 * All rights reserved.
 *
 * THIS PROGRAM IS PROVIDED UNDER THE TERMS OF THIS OSMC PUBLIC
 * LICENSE (OSMC-PL). ANY USE, REPRODUCTION OR DISTRIBUTION OF
 * THIS PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THE OSMC
 * PUBLIC LICENSE.
 *
 * The OpenModelica software and the Open Source Modelica
 * Consortium (OSMC) Public License (OSMC-PL) are obtained
 * from Link�pings University, either from the above address,
 * from the URL: http://www.ida.liu.se/projects/OpenModelica
 * and in the OpenModelica distribution.
 *
 * This program is distributed  WITHOUT ANY WARRANTY; without
 * even the implied warranty of  MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE, EXCEPT AS EXPRESSLY SET FORTH
 * IN THE BY RECIPIENT SELECTED SUBSIDIARY LICENSE CONDITIONS
 * OF OSMC-PL.
 *
 * See the full OSMC Public License conditions for more details.
 *
 */


#ifndef _UNITPARSER_H
#define _UNITPARSER_H

#include <vector>
#include <string>
#include <map>

using namespace std;

class Rational{
public:
	Rational(long numerator=0, long denominator=1);
	Rational(const Rational& r);
	virtual ~Rational(){;}
	long num;	//numerator
	long denom;	//denominator
	bool isZero();
	bool is(long numerator, long denominator=1);
	string toString(); //e.g. "(7/9)". If denominator is one, only numerator is printed, e.g. "7".
	double toReal();
	void fixsign();
	static Rational simplify(const Rational q);
	static Rational sub(Rational q1, Rational q2);
	static Rational add(Rational q1, Rational q2);
	static Rational mul(Rational q1, Rational q2);
	static Rational div(Rational q1, Rational q2);
	static long gcd(long a, long b);
};



struct UnitRes{
	UnitRes() : result(UNIT_OK), charNo(0) {;}
	enum ResVal{
		UNIT_OK,
		UNKNOWN_TOKEN,
		UNKNOWN_IDENT,
		PARSE_ERROR,
		UNIT_OFFSET_ERROR,
		UNIT_SCALE_ERROR,
		UNIT_WRONG_BASE, //Need to be base 10 for exponent prefixes
		UNIT_NOT_FOUND,
		PREFIX_NOT_FOUND,
		INVALID_INT,
		PREFIX_NOT_ALLOWED, //Some units e.g. "kg" are not allowed to have prefix. See SI-brochure v8, page 122, sec. 3.2
		BASE_ALREADY_DEFINED,
	};

	UnitRes(ResVal res, unsigned int charNumber = 0) : result(res), charNo(charNumber) {;}
	virtual ~UnitRes(){;}

	bool Ok() {return result == UNIT_OK;}
	ResVal result;			//Result enum
	unsigned int charNo;	//If error, charcter number in string where the error is
	string message;			//String message. E.g. for UNKNOWN_IDENT, the identifier is given
};

class Unit{
public:
	Unit(long pExp=0, long sFact=1, long off=0,double w = 1.0,bool b=false) :
	  prefixExpo(Rational(pExp)), scaleFactor(Rational(sFact)), offset(Rational(off)), prefixAllowed(true), weight(w) {;}

	/** Vector stating exponents to the unit vector */
	vector<Rational> unitVec;

	/** Exponent value for the prefix. E.g. if [mm] is defined, it is 10^-3*[m], e.g. prefixExpo = -3 */
	Rational prefixExpo;

	/** Scalar factor including both SI prefix and unit scalar factors (e.g. feet -> meter) */
	Rational scaleFactor;

	/** Offset to base unit. E.g. celcius have offset 273.15 (i.e. add 273.15 to the value to get it in Kelvin) */
	Rational offset;

	/** Unit type parameter vector. The strings include a prepend apostrophe  ,e.g. "'p"	*/
	map<string,Rational> typeParamVec;

	/** The quantity name, if known. */
	string	quantityName;

	/** The unit name, if known. */
	string	unitName;

	/** The unit symbol, if known. */
	string	unitSymbol;

	/* Returns true if both the unitVec only contains zero exponents, and there are no type parameters */
	bool isDimensionless();

	/* Returns true if the unit is a base unit. If it is a derived unit, false is returned. */
	bool isBaseUnit();

	/** Internal variable for handling kg units */
	bool prefixAllowed;

	/** Weight used for pretty printing algorithm */
	double weight;

	/* Division of two unit vectors */
	static UnitRes div(Unit u1, Unit u2, Unit& ur);

	/* Multiplication of two unit vectors */
	static UnitRes mul(Unit u1, Unit u2, Unit& ur);

	/* Exponent power on a unit vector */
	static UnitRes pow(Unit u, const Rational e, Unit& ur);
private:
	static UnitRes paramutil(Unit u1, Unit u2, Unit& ur, bool mulop);

};


class Base{
public:
	Base(string q, string un, string us, bool p, double w=1.0) : quantityName(q),
		unitName(un), unitSymbol(us), prefixAllowed(p),weight(w) {;}
	string quantityName;
	string unitName;
	string unitSymbol;
	bool prefixAllowed;
	double weight /*weight for pretty printing algorithm*/;
};

/* Scanner for a unit type string */
class Scanner{
public:
	Scanner(string str);
	virtual ~Scanner();
	enum TokenType{
		TOK_DIV,		//Div '/'
		TOK_LPARAN,		//Left parentheses '('
		TOK_RPARAN,		//Right parantheses ')'
		TOK_DOT,        //Dot character '.'
		TOK_EXPO,		//Exponent '^'
		TOK_ID,			//Identfier starting with only ascii characters. tokstr contains the string.
		TOK_PARAM,		//Unit type parameter. An identifier starting with an apostrophe. tokstr contains the string.
		TOK_INT,		//Integer. tokstr contains the string representation of the integer value.
		TOK_UNKNOWN,	//Unknown token
		TOK_EOS,		//End of string
	};

	/* Returns the next token in the string, or TOK_EOF if it is the last one.
	   If the token consist of a specific string  'tokstr'. If TOK_UNKNOWN is returned,
	   method getPos() can be called to get the integer index to the unknown token */
	TokenType getToken(string& tokstr);

	TokenType peekToken(string& tokstr);

	unsigned int getPos();
	unsigned int getLastPos();
	bool isTextChar(unsigned int i);
	bool isEOS(unsigned int i);
	bool isDigit(unsigned int i);
	unsigned int getpos() {return _index;}
	void setpos(unsigned int pos) {_index = pos;}
	bool finished();
private:
	Scanner::TokenType getTokenInternal(string& tokstr, unsigned int& index);
	string	     _str;
	unsigned int _index;
	unsigned int _lastindex;
};


class UnitParser{
public:
	UnitParser();
	virtual ~UnitParser();

	/** Add prefix symbols. E.g. "m" has exponent -3, (m=10^-3) */
	void addPrefix(const string symbol, Rational exponent);

	/**
	  Add a base quantity/unit
      @param prefixAllowed Normally set to true. Should be false for [kg], since we are not allowed to prefix this base unit.
	                                             Should instead prefix the "derived unit [g]
	*/
	void addBase(const string quantityName, const string unitName,
		const string unitSymbol, bool prefixAllowed);

	/** Add a derived quantity/unit */
	UnitRes addDerived(const string quantityName, const string unitName, const string unitSymbol,
		const string unitStrExp, Rational prefixExpo, Rational scaleFactor, Rational offset, bool prefixAllowed,double weight);

	/** Convert a unit vector to a unit text string (unparse) - simple version, e.g. "m-2.kg2.s-3" */
	string unit2str(Unit unit);

	/** Convert a unit vector to a unit text string (unparse) - using MIP algorithm to select most appropriate units */
	string prettyPrintUnit2str(Unit unit);

	/** Convert a unit text string to a unit vector type (parse) */
	UnitRes str2unit(const string unitstr, Unit& unit);

	/** Initiates the standard base and derived SI units according to the SI brochure, 8th edition, 2006*/
	void initSIUnits();



private:
	/** Prefixes */
	map<string,Rational> _prefix;

	/** Base quantities and units(vector of names) */
	vector<Base> _base;

	/** Mapping from unit symbol to unit definitions. Includes both base and derived units. */
	map<string,Unit> _units;

	/** Parse */
	UnitRes parseExpression(Scanner& scan, Unit& unit);
	UnitRes parseNumerator(Scanner& scan, Unit& unit);
	UnitRes parseDenominator(Scanner& scan, Unit& unit);
	UnitRes parseFactors(Scanner& scan, Unit& unit);
	UnitRes parseFactor(Scanner& scan, Unit& unit);
	UnitRes parseSymbol(Scanner& scan, Unit& unit);
	UnitRes parseRational(Scanner& scan, Rational& q);

	/* MIP */
	Unit solveMIP(Unit);
};






extern void TestScanner();




#endif /* _UNITPARSER_H */








