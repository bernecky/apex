 BackMultiConv←{
     (d_out weights in bias)←⍵
  ⍝⎕←'shape in ',(⍕⍴in), ' shape d_out ', ⍕⍴d_out
  ⍝⎕← ' shape weights ', ⍕⍴weights
     rk←¯1+⍴⍴in
     xx←1÷(⍴⍴d_out)≡1+⍴⍴in ⍝  rbe kant kode
     d_in←+⌿d_out{BackIn(⍺ ⍵ rk)}⍤rk⊢weights
     d_w←d_out{BackW(⍺ ⍵ in)}⍤rk⊢weights
     d_bias←{+/,⍵}⍤rk⊢d_out
     (d_in d_w d_bias)
 }
