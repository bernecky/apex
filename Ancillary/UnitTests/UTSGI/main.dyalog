 r←main;outerval;outerval2
⍝ Test passing of semi-global outerval2 into subfn
 outerval←42
 outerval2←666
 r←subfn outerval
 ⎕←r
 ⎕←r←1-r≡ 666+4×outerval
