 r←main;outerval;outerval2;z1;z2
⍝ Test simple multi-name strand assign
 outerval←42
 outerval2←666
 (z1 z2)←(outerval outerval2)
 r←z1+z2
 ⎕←r
 ⎕←r←1-r≡708
