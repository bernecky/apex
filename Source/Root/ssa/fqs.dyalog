﻿ r←fqs y
 ⍝ return incidence matrix of character constants in ⍵.
 ⍝
 r←y='''' ⍝   locate comments
 r←r≠0,0 ¯1↓r ⍝ remove double quotes.
 r←≠\r,⍴' this is a'' test now'
