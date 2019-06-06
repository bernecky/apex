 r←rtb y
 ⍝Rotate each row of text matrix left to first blank.
 r←(+/∧\y≠' ')⌽y
