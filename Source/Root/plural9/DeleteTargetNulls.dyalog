﻿ r←astlargrarg DeleteTargetNulls k;cv
⍝ Replace NULL! by something quieter
 cv←astlargrarg∊NULL
 r←k
 r[cv/⍳⍴cv]←E''
