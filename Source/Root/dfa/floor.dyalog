﻿ r←floor y
⍝ This because APL+Linux has a nasty bug, whereby
⍝ ⌊5÷2 starts to return 3, instead of 2! 2005-12-08/rbe
 r←y-1|y
