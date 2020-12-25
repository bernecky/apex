 Z←⍙TFTRANS
⍝Returns the native file translate table for Dyalog APL
 Z←⍙ASCII,128⍴'⎕'
 Z[⎕IO+10 13]←⍙TCLF,⍙TCNL
⍝ Arbitrary, but 1:1, translation for non-ASCII chars:
 Z[(Z='⎕')/⍳⍴Z]←'⎕',(~⎕AV∊Z)/⎕AV
⍝ APLASCII.DYALOG version 1.4 (1995.10.15)
