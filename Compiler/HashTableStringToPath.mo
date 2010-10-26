encapsulated package HashTableStringToPath "
	This file is an extension to OpenModelica.

  Copyright (c) 2007 MathCore Engineering AB

  All rights reserved.

  RCS: $Id: HashTable2.mo 6613 2010-10-26 12:50:18Z sjoelund.se $

  "
  
/* Below is the instance specific code. For each hashtable the user must define:

Key 			- The key used to uniquely define elements in a hashtable
Value 		- The data to associate with each key
hashFunc 	- A function that maps a key to a positive integer.
keyEqual 	- A comparison function between two keys, returns true if equal.
*/

/* HashTable instance specific code */

public import Absyn;
public import BaseHashTable;
protected import System;
protected import Util;

public type Key = String;
public type Value = Absyn.Path;

public type HashTableCrefFunctionsType = tuple<FuncHashCref,FuncCrefEqual,FuncCrefStr,FuncExpStr>;
public type HashTable = tuple<
  array<list<tuple<Key,Integer>>>,
  tuple<Integer,Integer,array<Option<tuple<Key,Value>>>>,
  Integer,
  Integer,
  HashTableCrefFunctionsType
>;

partial function FuncHashCref
  input Key cr;
  output Integer res;
end FuncHashCref;

partial function FuncCrefEqual
  input Key cr1;
  input Key cr2;
  output Boolean res;
end FuncCrefEqual;

partial function FuncCrefStr
  input Key cr;
  output String res;
end FuncCrefStr;

partial function FuncExpStr
  input Value exp;
  output String res;
end FuncExpStr;

public function emptyHashTable
"
  Returns an empty HashTable.
  Using the bucketsize 1000 and array size 100.
"
  output HashTable hashTable;
algorithm
  hashTable := BaseHashTable.emptyHashTableWork(1000,100,(System.hash,stringEqual,Util.id,Absyn.pathString));
end emptyHashTable;

public function emptyHashTableSized
"
  Returns an empty HashTable.
  Using the bucketsize size and arraysize size/10.
"
  input Integer size;
  output HashTable hashTable;
algorithm
  hashTable := BaseHashTable.emptyHashTableWork(size,size/10,(System.hash,stringEqual,Util.id,Absyn.pathString));
end emptyHashTableSized;

end HashTableStringToPath;
