 r←main;outerval1;r1
⍝ Test strand arguments to subfn
 outerval1←2
 r1←subfn1 (outerval1)
 r←r1
 ⎕←r
 ⎕←r←1-r≡ outerval1
