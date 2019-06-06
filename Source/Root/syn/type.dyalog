﻿ z←type y;⎕CT
⍝ Return type of array as:
⍝ b,i,d,c for boolean, integer, double, character
 ⎕CT←0
 z←,y
 :If ∧/z∊⎕AV     ⍝ Character
     z←'c'
 :ElseIf ∧/z∊0 1 ⍝ Boolean
     z←'b'
 :ElseIf (z≡z-1|z)∧~((1∊z>2147483647)∨1∊z<¯2147483648) ⍝ Integer
     z←'i'
 :Else
     z←'d'     ⍝ Double
 :EndIf
