﻿ r←ast IndexList i;p;j
 ⍝ Get list of indices for index
 ⍝ expression at row i of ast
 r←⍳0
 p←i
lp:p←D ast[p;astrarg] ⍝ ->next index list element
 →(p≡D NULL)⍴lz
 j←ast[p;astlarg] ⍝ Next index
 r←r,D j ⍝ Collect list of indices
 →lp
lz:
