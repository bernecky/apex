 r←EmitFnCallsDyadicScalar y;fns;cv;nf;gf;cal;t;ast;j;i
⍝# Emit function calls for dyadic scalar functions
⍝# The generic stuff is already done. All we
⍝# do here is to pick up special cases.
 j←EmitDyadicScalarFnCallsArgumentSwap y ⍝ Maybe swap args
 ast←D j[0] ⍝ ast
 fns←D j[2] ⍝ All fn names
 cal←D j[3] ⍝ Generic calls
⍝ Get dyadic scalar function names
 gf←6 FragmentCode'dscalar' ⍝ fn names we have, sort of...
⍝
⍝ Generate function names we need to call
 nf←MarkFnsnf fns
 cv←gf MarkFns nf ⍝ Mark fns we'll call
 cv←cv∧~fnsMonadic fns ⍝ Ignore monadic fns
 cv←cv∧~ast[;astfn]∊NULL ⍝ Ignore non-functions.
⍝ Generate macro name for loop control
 t←cv DyadicScalarFnQuicky ast ⍝ Special case suffixes
 /
 i←cv/⍳⍴cv
 cal[i;calranks]←t ⍝ Append suffixes, kill rank specifications
 cal←cv EmitAssignment cal
 fns[i;fnsranks]←fns[i;fnsranks],¨t
 r←j ⋄ r[2]←E fns ⋄ r[3]←E cal
