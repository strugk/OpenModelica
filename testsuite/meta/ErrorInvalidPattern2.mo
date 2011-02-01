// name: ErrorInvalidPattern2
// cflags: +g=MetaModelica
// status: incorrect

package ErrorInvalidPattern2

uniontype Ut
  record UT
  end UT;
end Ut;

function fn
  input Ut ut;
  output String str;
algorithm
  str := match ut
    case UT(exp = 1) then "fail1";
    else "fail2";
  end match;
end fn;

constant String str = fn(UT());

end ErrorInvalidPattern2;

// Result:
// Error processing file: ErrorInvalidPattern2.mo
// [ErrorInvalidPattern2.mo:17:10-17:22:writable] Error: Invalid named fields: exp
// [ErrorInvalidPattern2.mo:17:10-17:22:writable] Error: Invalid pattern: UT(exp = 1) of type ErrorInvalidPattern2.Ut
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
