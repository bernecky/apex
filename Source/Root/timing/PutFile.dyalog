 r←x PutFile fnm;ntn;⎕TRAP
⍝ Put x to dos file fnm as char vector
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
