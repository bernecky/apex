﻿ r←EmitFnCallsDyadicConjunction y;ast;cv;fns;cal
 ⍝# Emit function calls for inner products
 ast←D y[0]
 cv←D y[1]
 fns←D y[2]
 cal←D y[3]
 cv←ast[;astfn]∊ER1 mcb'.' ⍝ Not many of these today
 cv←cv∧~ast[;astlarg]∊NULL ⍝ Ignore outer product
 r←y
 cal←cv EmitAssignment(E ast),E cal
 r[3]←E cal
