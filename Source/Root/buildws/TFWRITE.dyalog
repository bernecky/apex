 r←x TFWRITE fnm;ntn;⎕TRAP
⍝ Put x to dos file fnm as char vector
 :If 2=⍴⍴x
     x←,x,⍙TCLF
 :EndIf
 ⎕TRAP←22 'C' '→exists'
 ntn←¯1+⌊/0,⎕NNUMS
 →ok
exists:⎕TRAP←0⍴⎕TRAP
 fnm ⎕NTIE ntn
 fnm ⎕NERASE ntn
ok:fnm ⎕NCREATE ntn
 x ⎕NAPPEND ntn
 ⎕NUNTIE ntn
 r←1
