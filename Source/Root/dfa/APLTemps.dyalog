﻿ r←astloprop APLTemps ast;p;cv
⍝# Mark temps in ast
 p←ast[;astloprop]
 r←(isnum p)∧~p∊NULL  ⍝ Real pointers
 cv←,r
 r←r∧(⍴r)⍴cv\(cv/,p)≥(dfainit ast)⍳1
