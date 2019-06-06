 tn←qcre8 fnm;⎕TRAP
 ⍝ Create file fnm. If it already
 ⍝ exists, delete all components from it
 tn←1+⌈/0,⎕FNUMS
 ⎕TRAP←22 'C' '→exists' ⍝ File already exists
 fnm ⎕FCREATE tn
 →lz
exists:⎕TRAP←0⍴⎕TRAP ⍝ Create failed - file exists
 fnm ⎕FSTIE tn
 ⎕FDROP tn,-/2↑⎕FSIZE tn
lz:
