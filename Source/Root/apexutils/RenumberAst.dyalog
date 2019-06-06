﻿ r←nn RenumberAst ast;t;i;j;k
 ⍝ Renumber ast pointers
 ⍝ A pointer i in the ast is replaced by nn[i].
 t←asttarget,astptrs
 j←~ast[;t]∊NULL ⍝ Ignore nulls and non-numbers
 j←,j∧isnum ast[;t]
 i←D j/,ast[;t] ⍝ Items to renumber
 k←,ast[;t]
 k[j/⍳⍴j]←ER0(nn)[i]
 r←ast ⋄ r[;t]←(⍴ast[;t])⍴k
