﻿ r←GetTimes txt;t;b
⍝ Get cpu times from txt file.
 t←(∨/'user'⍷txt)⌿txt
 b←,∧\t≠'u' ⍝ Drop "user..."
 t←D(⎕VFI b\b/,t)[1]
 r←(E squeeze txt[0;]),E t
