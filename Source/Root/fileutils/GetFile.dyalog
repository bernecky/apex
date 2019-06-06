﻿ r←GetFile fnm;ntn;nm
 ⍝ Get contents of dos file ⍵ as a character vec
 nm←dtb dlb fnm ⍝ Avoid mystery "file name error"
 nm ⎕NTIE ntn←¯1
 r←⎕NREAD ntn,82(⎕NSIZE ntn),0
 ⎕NUNTIE ntn
