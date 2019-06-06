﻿ r←FileNameBreak y;p;n
⍝ Break dos filename into path,name, suffix.
 p←(⌽∨\⌽y∊':\/')/y ⍝ drive and path
 r←(⍴p)↓y
 n←(∧\r≠'.')/r
 s←(1+⍴n)↓r
 r←dtb¨⌽¨dtb¨⌽¨(E p),(E n),E s
