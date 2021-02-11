 r←EmitLocalFns ast;cv;i;j;k;if1;c
 ⍝ Emit code for local fns
 ⍝ We emit the function naked. Curried args,
 ⍝ as in f&(+.×) are done by the invocation.
 ⍝ This is because I can't figure out any
 ⍝ other way to do it.
 i←ast[;astclass]∊astclassLFN ⍝ Locate localfns
 i←ER0(i∧~dfainit ast)/⍳⍴i
 cv←∨/ast[;astlop,astfn,astrop]∊i ⍝ Locate invocations
 if1←'' ⍝ Assume no work.
 ∘
