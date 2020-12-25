 r←BuildPFAT TargetLanguage;b;n;i;classdefn;class;ct;zt;t;js;hdr
 ⍝ Build PFAT table from pfat text
 r←PFATTEMP ⋄ →0


 PFATfn←0           ⍝ PFAT fn zymbol
 PFATct←1+PFATfn    ⍝ PFAT fn compute type class
 PFATzt←1+PFATct    ⍝ PFAT fn result type class
 PFATcfun←1+PFATzt   ⍝ PFAT commuting function
 PFATfncl←1+PFATcfun ⍝ PFAT function class
 PFATlid←1+PFATfncl ⍝ PFAT left-identity
 PFATl0←1+PFATlid   ⍝ PFAT left-zero
 PFATl1←1+PFATl0    ⍝ PFAT left-one
 PFATqct←1+PFATl1   ⍝ PFAT fn needs ⎕ct
 PFATqio←1+PFATqct  ⍝ PFAT fn needs ⎕io
 PFATqpp←1+PFATqio  ⍝ PFAT fn needs ⎕pp
 PFATqpw←1+PFATqpp  ⍝ PFAT fn needs ⎕pw
 PFATqrl←1+PFATqpw  ⍝ PFAT fn needs ⎕rl
 PFATuni←1+PFATqrl  ⍝ PFAT fn is uniform
 PFATcols←1+PFATuni ⍝ PFAT table width
 t←ReadFile #.globals.PathFrag,'pfat.tbl'
 t←TABtoBlank t
 t←vtom NL,nolf t
 hdr←' ',squeeze 1↓t[(t[;⍳3]∧.='%FN')⍳1;] ⍝ Column identifiers
 hdr←1↓¨PartitionedEnclose hdr
 b←,∧\t≠'%' ⍝ Remove comments
 t←(⍴t)⍴b\b/,t ⍝ Ignore comments
 t←dtbm(t∨.≠' ')⌿t ⍝ Drop blank rows, trim trailing blanks
⍝ Now break into defns and uses
 'Bobbo kant kode'assert'$top'≡t[0;⍳4] ⍝ Top marker
 t←1 0↓t
 i←t[;0]⍳'$' ⍝ Bottom marker
 classdefn←t[⍳i;] ⍝ Class definitions
 t←((i+1),0)↓t ⍝ Everything else is attributes
 class←field1 classdefn
 classdefn←lj(0,¯1↑⍴class)↓classdefn
 ct←field1 classdefn ⍝ Compute class
 ct←(TypesBig,'LR')[(Types,'lr')⍳ct]
 ct←ct⍪'?' ⍝ For those missing ones
 classdefn←lj(0,¯1↑⍴ct)↓classdefn
 zt←field1 classdefn ⍝ Result class
 zt←(TypesBig,'LR')[(Types,'lr')⍳zt]
 zt←zt⍪'?' ⍝ For those missing ones
 class←dtb¨ER1 class
⍝
⍝ Now handle references to classes
 r←((1↑⍴t),PFATcols)⍴E''
 i←field1 t ⍝ function jsymbols
 t←ZapField1 t
 r[;PFATfn]←dtb¨ER1 i ⍝ Easier lookup
 i←field1 t ⍝ compute type
 t←ZapField1 t
 r[;PFATct]←⍪ER1 ct[class⍳dtb¨ER1 i;]
 i←field1 t ⍝  result type
 t←ZapField1 t
 r[;PFATzt]←⍪ER1 zt[class⍳dtb¨ER1 i;]
 i←field1 t ⍝ Dyadic commuter function
 t←ZapField1 t
 r[;PFATcfun]←dtb¨⍪ER1 i
 i←field1 t ⍝ function class
 t←ZapField1 t
 r[;PFATfncl]←dtb¨⍪ER1 i
 i←field1 t ⍝ Left identity
 t←ZapField1 t
 r[;PFATlid]←dtb¨⍪ER1 i
 i←field1 t ⍝ Left zero
 t←ZapField1 t
 r[;PFATl0]←dtb¨⍪ER1 i
 i←field1 t ⍝ Left one
 t←ZapField1 t
 r[;PFATl1]←dtb¨⍪ER1 i
 i←field1 t ⍝ fn needs ⎕ct
 t←ZapField1 t
 r[;PFATqct]←dtb¨⍪ER1 i
 i←field1 t ⍝ fn needs ⎕io
 t←ZapField1 t
 r[;PFATqio]←dtb¨⍪ER1 i
 i←field1 t ⍝ fn needs ⎕pp
 t←ZapField1 t
 r[;PFATqpp]←dtb¨⍪ER1 i
 i←field1 t ⍝ fn needs ⎕pw
 t←ZapField1 t
 r[;PFATqpw]←dtb¨⍪ER1 i
 i←field1 t ⍝ fn needs ⎕rl
 t←ZapField1 t
 r[;PFATqrl]←dtb¨⍪ER1 i
 i←field1 t ⍝ fn has uniform shape
 t←ZapField1 t
 r[;PFATuni]←dtb¨⍪ER1 i
 r←hdr⍪r
