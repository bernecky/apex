  isListOfExpns←{
  ⍝ Check for Strand on Stack ⍵  at offset ⍺ from TOS
  ⍝ (a b) is a strand; (c) is not a strand
  sz←⍴')'StrandItems ⍺
  st←(-sz)↑⍺ StackDrop ⍵
  ⍝ (id id) or (id id id) or (id n id) or ( id n (2+3))...
  (sz≥2) ∧ ∧/st[;Stktokcl]∊clsid,clsnum,clsexpn 
 }
 
