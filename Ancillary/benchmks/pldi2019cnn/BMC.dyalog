 BMC←{
 ⍝   Back Multi-Conv
     (d_out weights in bias)←⍵
  ⍝⎕←'shape in ',(⍕⍴in), ' shape d_out ', ⍕⍴d_out
  ⍝⎕← ' shape weights ', ⍕⍴weights
     rk←⍴⍴in
     d_in←+⌿d_out{BackIn(⍺ ⍵ in)}⍤rk⊢weights
     d_w←d_out{BackW(⍺ ⍵ in)}⍤rk⊢weights
     d_bias←{+/,⍵}⍤rk⊢d_out
     (d_in d_w d_bias)
 }
