﻿ r←ConstantsSACCharacter ast;cv;i;j
 ⍝ Convert APL Char constants to SAC format
 cv←ast[;astclass]∊astclassCC
 i←(cv⌿ast)[;astvalue] ⍝ Extract char constants
 ⍝ Turn 'abc' into  'a','b','c'
 i←CSACChar¨i
 ast[cv/⍳⍴cv;asttarget]←i
 r←ast
