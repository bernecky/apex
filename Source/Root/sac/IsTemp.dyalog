﻿ r←ast IsTemp p
⍝ Determine which elements of ast[p;] are temps.
⍝ That is, they have only 1 referent, and do not
⍝ have side effects.
 r←p∊ast[p;asttarget]
⍝ This code is incomplete, as it does not
⍝ handle temps with multiple referents. 1996-07-10
