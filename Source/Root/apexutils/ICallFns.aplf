 r←ICallFns y;i;ast;ic
 ⍝ Get fn name, names of fns called by ast, #calls
 ast←D y[ssaast]
 ic←ICalln ast
 r←ast[dfnname,D ic[0];asttarget]
 r←(E r),ic[1]
⍝ R. Bernecky 2005-07-12
