 r←EmitFnCallsTakeDrop y;fns;cv;cal;ast;sc;ctl
⍝# Emit calls for take and drop (at least)
⍝# The generic stuff is already done. All we
⍝# do here is to pick up special cases.
 r←y
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
⍝ Get function names
 ctl←7 FragmentCode'takedrop'
 cv←∨/<\(ctl FindFn fns)∧ctl FindType fns
 cal[cv/⍳⍴cv;calranks]←E'' ⍝ No argument rank needed for SAC
 cal←cv EmitAssignment(E ast),E cal
 r←y ⋄ r[3]←E cal
