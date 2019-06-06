﻿ r←asts1 IsClone asts2;ast1;ast2
⍝ Predicate for determining if two
⍝ functions are clones
 ast1←D asts1[ssaast]
 ast2←D asts2[ssaast]
 r←(⍴ast1)≡⍴ast2
 :If r
     r←(D asts1[ssaast])≡¨D asts2[ssaast]
     r[dfnname;asttarget]←1 ⍝ Ignore fn name
     r[;astShapeClique]←1 ⍝ Ignore shape clique numbers
     r←∧/,r
 :EndIf
