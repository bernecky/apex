﻿ r←ast IsDFun n;k
⍝ Which of the entries in n are
⍝ derived or defined fns?
 r←(~n∊NULL)∧isnum n ⍝ reduce to varb vs fn issue
 :If 1∊r
     k←astclassDFN,astclassMFN,astclassLFN,astclassGFN
     r←r\ast[r/n;astclass]∊k
 :EndIf
