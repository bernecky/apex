 r←EmitFnCallsDyadicEpioPrimitive y;fns;cv;nf;lht;rht;zt;cal;ast;ctl
⍝# Emit calls for dyadic epsilon and dyadic iota
 r←y
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 ctl←6 FragmentCode'epio'
 cv←∨/<\(ctl FindFn fns)∧ctl FindType fns
 fns[cv/⍳⍴cv;fnslpar]←E'' ⍝ Remove rank indicator
 r←y ⋄ r[3]←E cal
