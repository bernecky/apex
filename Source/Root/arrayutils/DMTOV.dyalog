﻿ Z←{A}DMTOV B
 ⍝Converts matrix ⍵ to an ⍺-delimited vector
 ⍝ ⍺ starts each row
 :If 0=⎕NC'A'
     A←NL
 :EndIf
 Z←,1,⌽∨\⌽B≠' ' ⍝ delete trailing blanks
 Z←Z/,A,B
