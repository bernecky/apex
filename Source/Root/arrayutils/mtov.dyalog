﻿ Z←A mtov B
 ⍝ Converts matrix ⍵ to vector w/trailing A
 Z←,(⌽∨\⌽~B∊' '),1 ⍝ delete trailing blanks
 Z←¯1↓Z/,B,A

