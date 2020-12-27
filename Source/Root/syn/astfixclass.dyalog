﻿ r←ast astfixclass astr;c;rc;i;j;k
 ⍝ Correct astclass for ast, based on astr element derived
 ⍝ from each line of function.
 c←ast[;astclass]
 rc←(D(E⍴ast)↑¨astr)[;;astclass]
 rc←(~c ≡⍤1⊢ rc)⌿rc ⍝ Ignore those that are OK (thus far)
 :For i :In ⍳1↑⍴rc
     j←~rc[i;]∊NULL ⍝ Locate known classes in line
     k←c∊NULL ⍝ that are not known in ast.
     c[(j∧k)/⍳⍴j]←(j∧k)/rc[i;]
 :EndFor
 r←ast
 :If 0∊i←r[;astclass]≡¨c ⍝ Any work?
     ⎕←'astfixclass setting astclass for: ',ast[0;asttarget]
     ⎕←'was:'
     ⎕←(~i)⌿ast
     ⎕←'is:'
     r[;astclass]←c
     ⎕←(~i)⌿r
     rc←(D(E⍴ast)↑¨astr)[;;astclass] ⍝ Now classes must match
     'Single assigment bug'assert(rc∊NULL)∨rc ≡⍤0⊢(⍴rc)⍴c
 :EndIf
