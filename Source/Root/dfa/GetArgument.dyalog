﻿ r←GetArgument astr
⍝ Extract value of this row as array of
⍝ proper type, shape, rank
 r←D astr[astvalue]
 :If asttypeC≠D astr[asttype]
     r←quadfi r
 :EndIf
 r←(D astr[astshape])⍴r
