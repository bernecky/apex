﻿ r←ConstantsSACInteger ast;cv;c;i;j
 ⍝ Convert Integer APL constants to SAC format
 cv←ast[;astclass]∊astclassNC
 cv←cv∧ast[;asttype]∊asttypeI ⍝ Just the integers
 c←(cv⌿ast)[;asttarget] ⍝ Get numerics
 r←ast
 :If ×⍴c ⍝ Stupid APL2 prototypes
     j←,D Raze c
     k←(⍴¨c)↑¨1
     k←,D Raze k
     c←k PartitionedEnclose j
     c←Twop31Kludge¨c
     c←InsertCommas¨c
     c←ReplaceHiMinus¨c
     r[cv/⍳⍴cv;asttarget]←c
 :EndIf
