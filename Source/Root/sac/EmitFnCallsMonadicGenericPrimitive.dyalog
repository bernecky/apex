 r←EmitFnCallsMonadicGenericPrimitive y;fns;cv;cal;ast
⍝# Emit calls for monadic generic fns with no fancy needs.
 r←y
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
⍝ Get function names
 ctl←6 FragmentCode'mscalar'
 cv←∨/<\(ctl FindFn fns)∧ctl FindType fns
 r←y ⋄ r[3]←E cal
