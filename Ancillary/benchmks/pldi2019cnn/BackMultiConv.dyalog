BackMultiConv← {
  (d_out weights in bias) ← ⍵
  ⍝⎕←'shape in ',(⍕⍴in), ' shape d_out ', ⍕⍴d_out
  ⍝⎕← ' shape weights ', ⍕⍴weights
  d_in ← +⌿d_out {BackIn(⍺ ⍵ in)}⍤(⍴⍴in) ⊢ weights
  d_w ← d_out {BackW(⍺ ⍵ in)} ⍤ (⍴⍴in)  ⊢ weights
  d_bias ← {+/,⍵}⍤ (⍴⍴in) ⊢ d_out
  (d_in d_w d_bias)
 }
