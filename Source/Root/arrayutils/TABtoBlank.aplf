 r←{sep}TABtoBlank txt;b;pl
⍝ Replace tabs by blanks in txt
⍝ Tabs are 8 apart; tab in column 0 puts us in column 8.
⍝ Each tab introduces 1-8 blanks
 :If (0=⎕NC'sep')
     sep←TAB
 :EndIf
 r←((sep≠1↑txt)/sep),txt
 b←sep=r
 pl←8-8|plengths b
 r[b/⍳⍴b]←' '
 pl←1+b\¯1⌽pl
 r←(1↓pl)/1↓r
