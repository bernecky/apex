﻿ j←domt WhichPred wv;w;v;n
 ∘ ⍝ Probably wrong.
 ⍝ jTH predecessor of w is v in dominator tree
 ⍝ It shouldn't be too hard to precompute this
 ⍝ table if need be. 1995-05-17
 w←wv[0] ⋄ v←wv[1] ⋄ j←0 ⋄ n←Pred domt
lp:j←j+1 ⋄ w←n[;w]⍳1
 →(w≠v)⍴lp
