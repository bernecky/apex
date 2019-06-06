 r←DerivedFnCallTree ast;i;oldr
 ⍝ Compute calling tree for ast within itself.
 ⍝ This is for derived fns
 i←ast[;astlop,astfn,astrop]
 r←(⍴ast)[0 0]⍴ER0⍳1↑⍴ast
 r←,D(ER1 r)∊¨ER1 i ⍝ Immediate predecessors
lp:i←r∨.∧r ⍝ transitive closure
 oldr←r ⋄ r←r∨i
 →(~r≡oldr)⍴lp
