﻿ r←IsDyadic fns
⍝ Predicate for monadic vs dyadic fns
 r←'X'≠(D fns[;fnstypes])[;0]
