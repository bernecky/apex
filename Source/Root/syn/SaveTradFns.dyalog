﻿ SaveTradFns←{
     src fnm←⍵
     txt←(E'∇ '),¨(NL mtov¨src),¨E NL,'∇',NL,NL
     ⍝⍝⍝txt[(txt∊NL)/⍳⍴txt]←E CR,LF ⍝ Curse you, Bill
     ⍝⍝⍝txt[(txt∊NL)/⍳⍴txt]←CR
     txt←D Raze txt
     fl←PathFileName (-PathDelim=¯1↑fnm)↓fnm
     txt PutFile fnm,PathDelim,fl,'.tradapl'
 }
