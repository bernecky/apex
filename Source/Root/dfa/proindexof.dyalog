﻿ indices←sequence proindexof vector
 ⍝ progressive dyadic iota, e.g.  [⎕io←1] 'aba' proindexof 'acaaba' ←→ 1 4 3 4 2 4.  ⎕io-responsive.
 ⍝ (sauce/proindexof.1 from the sharp apl utility library)
 sequence←,sequence
 indices←((⍋sequence⍳sequence,vector)⍳⍳⍴sequence)⍳(⍋sequence⍳vector,sequence)⍳⍳×/⍴vector
