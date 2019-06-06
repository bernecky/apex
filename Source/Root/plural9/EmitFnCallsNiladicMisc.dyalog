 r←EmitFnCallsNiladicMisc y;ast;fns;cal;cv;ctl
⍝# Emit calls for niladic fns (⎕av, ⎕ts)
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 ctl←7 FragmentCode'sysfnsniladic'
 cv←∨/<\(ctl FindFn fns)∧ctl FindType fns
 cal[cv/⍳⍴cv;calranks]←E'' ⍝ No ranks in SAC
 cal←cv EmitAssignment(E ast),E cal
 r←y ⋄ r[3]←E cal
