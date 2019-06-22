﻿ r←quadfi y
⍝ QUAD-fi in disguise, for Dyalog APL
 :If (0∊⍴y)∨(0=1↑0⍴y) ⍝ Empty or already numeric
     r←(⍴y)⍴y ⍝ Stupid APL2 prototypes
 :Else
     r←D(⎕VFI y)[1]
 :EndIf
