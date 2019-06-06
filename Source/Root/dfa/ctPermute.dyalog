 r←pv ctPermute y;fns;ct
 ⍝ Permute connectivity matrix [and fn names] by pv
 fns←D y[0] ⋄ ct←D y[1]
 fns←fns[pv]
 ct←ct[pv;] ⋄ ct←ct[;pv]
 r←(E fns),E ct
