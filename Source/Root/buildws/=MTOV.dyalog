 Z←A ⍙MTOV B
 ⍝Converts matrix ⍵ to an ⍺-delimited vector
 ⍝ ⍺ starts each row
 :If 0=⎕NC'A'
     A←⎕TC[1]     ⍝ Dyalog ⎕ml=3
 :EndIf
 Z←,1,⌽∨\⌽B≠' ' ⍝ delete trailing blanks
 Z←Z/,(''⍴A),B
