﻿ r←x dftype y;i
 ⍝ dyadic scalar function result type.
 ⍝ x is functions, y is argument types.
 ⍝ Ya know, this oughta drive off pfat.tbl
 r←asttypeB maxtype y ⍝ Usually max of types.
 r[(x∊ER1 mcb'÷○')/⍳⍴r]←asttypeD ⍝Floats.
 r[(x∊ER1 mcb'<≤=≥>≠∨∧⍱⍲')/⍳⍴r]←asttypeB ⍝ Booleans.
