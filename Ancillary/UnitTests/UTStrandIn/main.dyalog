 r←main;outerval1;outerval2;outerval3;r1;r2;r3
⍝ Test strand arguments to subfn
 outerval1←2
 outerval2←5
 outerval3←1
 r1←subfn1 (outerval1)
 r2←subfn2 (outerval1 outerval2)
 r3←subfn3 (outerval1 outerval2 outerval3)
 r←r1+r2+r3
 ⎕←r
 ⎕←r←1-r≡ outerval3 + (2×outerval2) + (3×outerval1)
