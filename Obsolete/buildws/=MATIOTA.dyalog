﻿ Z←A ⍙MATIOTA B;T
 ⍝ Returns row indices of names ⍵ in lookup table ⍺
 T←(¯1↑⍴A)⌈¯1↑⍴B
 A←⊂[⎕IO+1]((1↑⍴A),T)↑A
 B←⊂[⎕IO+1]((1↑⍴B),T)↑B
 Z←A⍳B
