﻿ r←PrimitiveToJsym y;nm
 ⍝ Return boxed jsymbols for boxed APL primitive symbols y
 nm←dtb¨ER1 jsymbols[;⍳4]⍪'????'
 r←nm[(ER1 jsymbols[;,29])⍳y]
