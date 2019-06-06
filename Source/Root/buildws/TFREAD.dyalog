 r←TFREAD fnm;ntn
 ⍝ Read file fnm as a character matrix
 fnm ⎕NTIE ntn←¯1+⌊/0,⎕NNUMS
 r←⎕NREAD ntn,82(⎕NSIZE ntn),0
 ⎕NUNTIE ntn
 r←⍙VTOM ⍙TCLF,r
