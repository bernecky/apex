﻿ r←FilterFns fns;b;yaqqik;cv
⍝# Remove non-primitives, empties, and duplicates from fns table
 yaqqik←E'qdd' ⍝ Yet Another QuoteQuad Input Kludge
 cv←fns[;fnsfn]∊yaqqik,1↓¨PFAT[;PFATfn]
 cv←cv∨fns[;fnsfn]∊E'CommandLineArgv'
 r←D nub ER1 cv⌿fns
