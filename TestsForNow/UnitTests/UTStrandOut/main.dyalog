 r←main;outerval;outerval2;z1;z2
⍝ Test passing of semi-global results out of subfn as strand
 outerval←42
 outerval2←666
 (z1 z2)←outerval subfn outerval2
 r←z1+z2
 ⎕←r
 ⎕←r←1-r≡708
