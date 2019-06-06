 r←CallTree ast;i;cv
 ⍝ Compute calling tree for ast within itself.
 ⍝ This is for derived fns
 i←ast[;astlop,astfn,astrop]
 cv←,(isnum i)∧~i∊NULL
 i←(⍴i)⍴cv\cv/,i
 ∘
