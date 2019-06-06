﻿ sis←ctl EmitInnerProductOneSTARLIKE fns;n;fns2;f;fnm
 ⍝# Emit one STARLIKE algorithm inner product
 sis←''
 prim←11 FragmentCode'dscalar' ⍝ Domain still scalarfns. Sigh
  ⍝ Select special cases. See commentary in dconj.frg.
 :If (case←IsCaseSTAR fns)∊'01'
     n←ctl FindRankGen fns
     n←<\(ctl FindFnOnly,(1,¯1↑⍴fns)⍴E'dotSTAR')∧n
     sis←ctl Getsis n ⍝ The STAR-100 algorithm
     sis←'$FGID'Strepl sis,E case
   ⍝ Emit Vector f Vector scalar fn
     fns2←fns[;fnslop]BuildScalarFnsEntry fns
     fns2[;fnsranks]←E'111' ⍝ Vector-vector f reduce step
     fnm←D Raze⍉fns2[;fnsfn,fnstypes]
     sis←'$FLVALUE'Strepl(E sis),E fnm
     f←EmitDyadicScalarFns fns2
     sis←sis,,D D f[0]
     'rbe kant kode'assert 0∊⍴D f[1]
   ⍝ Emit Scalar g Vector scalar fn
     fns2←fns[;fnsrop]BuildScalarFnsEntry fns
     fns2[;fnsranks]←E'011' ⍝ Scalar-vector g step
     fnm←D Raze⍉fns2[;fnsfn,fnstypes]
     sis←'$FRVALUE'Strepl(E sis),E fnm
     f←EmitDyadicScalarFns fns2
     sis←sis,,D D f[0]
     'rbe kant kode'assert 0∊⍴D f[1]
 :EndIf
