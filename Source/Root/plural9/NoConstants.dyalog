﻿ r←ast NoConstants y;p
⍝ Replace constants by their ast index
⍝ This is used for naming assigns to constants
 r←y
 p←ast[;astclass]∊astclassNC,astclassCC
 r[p/⍳⍴p]←p/⍳⍴p
