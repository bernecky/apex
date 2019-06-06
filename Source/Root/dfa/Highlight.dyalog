﻿ r←color Highlight txt
⍝ Generate RTF highlighting for txt
⍝ BillWare(tm)'s stupid color mapping is:
⍝ black=1,     blue=2,         cyan=3,        green=4
⍝ magenta=5,   red=6,          yellow=7,      n/a=8
⍝ dark blue=9, dark cyan=10,   dark green=11, dark magenta=12
⍝ dark red=13, dark yellow=14, dark grey=15,  light grey=16
 r←,((E'\highlight'),¨⍕¨color),¨' '
 r[(,txt=' ')/⍳⍴r]←E''     ⍝ No highlight for blanks
 r←((⍴txt)⍴r),¨txt
