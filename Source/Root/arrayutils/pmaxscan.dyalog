﻿ result←boolean pmaxscan array;t
 ⍝ partitioned ⌈\array.  each 1 in <boolean> designates the beginning of a part.  ⎕io-independent.
 ⍝ (sauce/pmaxscan.1 from the sharp apl utility library)
 t←(⍴array)⍴+\boolean\¯2×⌈/|0,,array
 result←1/t+⌈\array-t
