﻿ r←fnsMonadic fns
⍝# Predicate for fns item being monadic
 r←'X'=((D fns[;fnstypes]),'?')[;0] ⍝ Catenate for empties
