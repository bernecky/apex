 r←main;outerval1;outerval2
⍝ Test passing of semi-global result innerval1 out of subfn
 r←subfn 42
 outerval1←innerval1
 r←r+outerval1
 ⎕←r
 ⎕←r←1-r≡ 708
