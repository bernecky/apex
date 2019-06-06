 r←jsym y;k
 ⍝ Return boxed name(s) for primitive(s) y
 k←dtb¨ER1 jsymbols[;26 27 28]
 r←(jsymbols⍪' ')[k⍳y;⍳6]
 r←(+/r≠' ')⍴¨ER1 r ⍝ Trim trailing blanks
