﻿ r←prim FindFn fns
 ⍝ Match function names
 r←(Raze⍉fns[;fnslop,fnsfn,fnsrop])∘.≡prim[;1]
