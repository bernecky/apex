 r←loprop ConjToFns fns;tps
⍝# Gen derived fn fns entry from conjunction/adverb fns entry
 r←fns
 :If ~0∊⍴fns ⍝ Stupid APL2 prototypes
     r[;fnslop,fnsfn,fnsrop]←(E''),fns[;,loprop],E''
     tps←D fns[;fnstypes]
     tps←ER1 tps[;fnstypesz,fnstypesrarg,fnstypesz]
     r[;fnstypes]←tps
     r[;fnsranks]←E'000'
 :EndIf
