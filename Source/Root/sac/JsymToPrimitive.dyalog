﻿ r←JsymToPrimitive y;nm
 ⍝ Return APL primitive symbol for boxed jsymbols y
 nm←dtb¨ER1 jsymbols[;⍳4]
 r←jsymbols[nm⍳y;29]
