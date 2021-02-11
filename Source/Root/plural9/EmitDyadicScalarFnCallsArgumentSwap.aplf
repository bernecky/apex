 r←EmitDyadicScalarFnCallsArgumentSwap y;i;new;fns;cal;j;k;ast
⍝ For any dyadic scalar function that is commutative,
⍝ swap the arguments to place a scalar right arg
⍝ on the left. We do this for scalars because OSC
⍝ produces better code if the scalar is on the left.
 r←y
 →0

⍝ HOPEFULLY, not needed by SAC.
 ast←D y[0] ⋄ fns←D y[2] ⋄ cal←D y[3]
⍝ Find fns to swap
 i←D fns[;4] ⍝ Find fns to swap based on rank
⍝ Dyadic with scalar right, nonscalar left
 i←(i[;0]≠'0')∧(i[;0]≠'x')∧i[;1]='0'
⍝ and fn has a commuter
 j←i/Raze⍉fns[;0 1 2] ⍝ lop,fn,rop
 j←PFAT[;PFATfn]⍳j
 new←(PFAT[;PFATfncl],E,'.')[j] ⍝ Pick up commuter, if any
 k←~new∊E,'.' ⍝ Ignore cases where no commuter exists
 →(0=∨/i←i\k)⍴lz ⍝ No work. Avoid stupid empty array woes below
⍝ We'll swap the arguments for fns indicated by i
 j←D i⌿fns[;4] ⋄ j←j[;1 0 2] ⋄ fns[i/⍳⍴i;4]←ER1 j
 j←D i⌿fns[;3] ⋄ j←j[;1 0 2] ⋄ fns[i/⍳⍴i;3]←ER1 j
 fns[i⌿⍳⍴i;1]←k/new ⍝ Insert new function name(s)
 cal[i/⍳⍴i;1]←(E':= '),¨Raze⍉i⌿fns[;⍳5] ⍝ Ditto
 cal[i/⍳⍴i;3 5]←cal[i/⍳⍴i;5 3]
 ast[i/⍳⍴i;astlarg,astrarg]←ast[i/⍳⍴i;astrarg,astlarg]
lz:r←y ⋄ r[0]←E ast ⋄ r[2]←E fns ⋄ r[3]←E cal
