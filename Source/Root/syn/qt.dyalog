﻿ r←qt n
 ⍝ Quick tie of file n to an available tie #
 r←tied n
 :If 0∊⍴r
     r←1+⌈/0,⎕FNUMS
     n ⎕FSTIE r
 :EndIf
