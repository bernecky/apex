 r←FixLocalFns ast;cv;i;j;k;if1;c
 ⍝ Emit code & fix ast for local fns
 ⍝ We emit the function naked. Curried args,
 ⍝ as in f&(+.×) are done by the invocation.
 ⍝ This is because I can't figure out any
 ⍝ other way to do it.
 i←ast[;astclass]∊astclassLFN ⍝ Locate localfns
 i←ER0(i∧~dfainit ast)/⍳⍴i
 cv←ast[;astlop,astfn,astrop]∊i ⍝ invocations
 cv←∨/cv ⍝ Get ast rows using LFNs
 if1←'' ⍝ Assume no work.
 ∘
 →(0=⍴i)⍴lz ⍝ No work
 ⍝ Cases:
 ⍝    Local fn           ----Invocation---
 ⍝                       Monadic    Dyadic
 ⍝    Dyadic              (no fill needed)
 ⍝    Monadic left(f&Y)   rarg->rarg Error
 ⍝    (move invoc. rarg to larg, then
 ⍝      copy Y to rarg)
 ⍝    Monadic(X&f)        larg->larg Error
 j←astlop,astfn,astrop
 r[cv/⍳⍴cv;j]←ast[i;j] ⍝ Fill
 ⍝ Fill arguments. Right arg OK unless fill left
 k←ast[i;astlarg,astrarg]∊NULL ⍝ Fill left?
 ⍝ Error handling left to the future
 ⍝ Move invocation rarg to larg
 ⍝ for left fill invocation
 j←cv\>/k ⍝ Left monadic
 r[j/⍳⍴j;astlarg]←ast[j/⍳⍴j;astrarg]
 ⍝ Move Y to rarg
 r[j/⍳⍴j;astrarg]←ast[j/i;astrarg]
 ⍝ For monadic, move fn larg to invoc larg
 r[(cv\</k)/⍳⍴j;astlarg]←ast[(</k)/i;astlarg]
 ast←r
 ⍝ Now emit code for local fn defns
 ∘
lz:r←(<if1),<ast
