﻿ r←benchlp n;i;j
 ⍝ Simple counter loop
 ⍝ dcl integer scalar n
 ⍝ dcl integer scalar i
 ⍝ dcl integer scalar j
 r←2-2
 :For i :In ⍳n
     :For j :In ⍳i
         r←r+j
     :EndFor
 :EndFor
 :For k :In ⍳n
     r←r+k
 :EndFor
