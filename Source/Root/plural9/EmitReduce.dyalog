﻿ r←wl EmitReduce y;ast;i;j;k;if1;c;fns;inv;astf;cv;ssa
 ⍝ Emit code for reduce w/derived operands
 ssa←D y[0] ⋄ fns←D y[1] ⋄ ast←D ssa[ssaast]
 r←(E''),(E ssa),E wl ⋄ →(0=∨/wl)⍴0 ⍝ No work
 ⍝ Reductions with derived/defined fns ONLY!!!!!!
 i←ast[;astclass]∊astclassLFN ⍝ Locate localfns
 i←i∧wl∧ast[;astfn]∊ER1 mcb'/⌿' ⍝ Reductions
 i←ER0(i∧~dfainit ast)/⍳⍴i
 cv←ast[;astlop,astfn,astrop]∊i ⍝ invocations
 cv←∨/cv ⍝ Get ast rows using LFNs
 i←D(inv←cv⌿ast)[;astrop] ⍝ fns to emit
 ⍝ Now merge invocations with fns.
 astf←ast
 wl←wl∧~cv ⍝ Update worklist
 if1←'' ⋄ →(~1∊cv)⍴lz ⍝ No work
 ∘
 ⍝ Cases:
 ⍝    Local fn           ----Invocation---
 ⍝                       Monadic    Dyadic
 ⍝    Dyadic              (no fill needed)
 ⍝    Monadic left(f&Y)   rarg->rarg Error
 ⍝    (move invoc. rarg to larg, then
 ⍝      copy Y to rarg)
 ⍝    Monadic(X&f)        larg->larg Error
 j←astlop,astfn,astrop
 astf[cv/⍳⍴cv;j]←ast[i;j] ⍝ Fill
 ⍝ Fill arguments. Right arg OK unless fill left
 k←ast[i;astlarg,astrarg]∊NULL ⍝ Fill left?
 ⍝ Error handling left to the future
 ⍝ Move invocation rarg to larg
 ⍝ for left fill invocation
 j←cv\>/k ⍝ Left monadic
 astf[j/⍳⍴j;astlarg]←ast[j/⍳⍴j;astrarg]
 ⍝ Move Y to rarg
 astf[j/⍳⍴j;astrarg]←ast[j/i;astrarg]
 ⍝ For monadic, move fn larg to invoc larg
 astf[(cv\</k)/⍳⍴j;astlarg]←ast[(</k)/i;astlarg]
 ∘∘
 ast←r
 ⍝ Now emit code for local fn defns
 ∘
lz:r←(E if1),(E ssa),E wl
