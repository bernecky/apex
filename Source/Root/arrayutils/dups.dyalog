﻿ r←dups y
 ⍝ Return elements of y that occur more than once.
 r←nub((⍳⍴y)≠y⍳y)/y
