﻿ r←stb y
 ⍝Shift rows of text matrix left to first blank.
 r←(⍴y)↑(+/∧\y≠' ')⌽y,(⍴y)⍴' '
