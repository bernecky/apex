﻿ foo;t;n;P;z
 ⍝ Extract benchmark timings for use by spreadsheet
 files←GetFiles'sandbox'
 times←D GetTimes¨files ⍝ Times in seconds
 t←1000×1↓¨times[;,1]  ⍝ Ignore first time, due to startup costs
 n←⍴¨t
 t←⍕¨¨t
 t←t,¨¨'+'
 t←¯1↓¨D Raze¨t
 t←(E'=('),¨t
 t←t,¨(⍴t)⍴(E')/'),¨⍕¨,n
 z←,⍕times[;,0],(D Raze⍉t),LF
 z PutFile'sandbox/times.txt'
