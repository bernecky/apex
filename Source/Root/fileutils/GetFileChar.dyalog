﻿ r←GetFileChar fnm;ntn;nm
 ⍝ Read file fnm as 32-bit char
nm←dlb dtb fnm
r←⎕nget nm ⋄ r←⊃r[0]

