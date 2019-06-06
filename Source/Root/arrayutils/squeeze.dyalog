﻿ compressed←{element}squeeze vector;b
 ⍝ removes all leading, trailing, and redundant <element>s from <vector>;  [...]
 ⍝ default <element> is 1↑0⍴vector (i.e. 0 or ' ').  e.g.  squeeze '   ab   cde f  ' ←→ 'ab cde f'.  ⎕io-independent.
 ⍝ (sauce/squeeze.1 from the sharp apl utility library)
 :If 0=⎕NC'element'
     element←1↑0⍴vector
 :EndIf
 b←vector∊element
 compressed←¯1↓((b,1)⍲1,b)/vector,element
