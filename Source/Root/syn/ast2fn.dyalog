﻿ ast2fn;i;k
⍝ Verb left of anything
 i←c gett(E src),E tok
 :Select state
 :Case Stn             ⍝ Verb left of bos:            f←+
     state←(StV,StN)[clsNilFn=D i[GettClass]]    ⍝    f←+vs f←NilFN
     PushCursor i Push state  ⍝ Push cursor past verb
 :Case Stf             ⍝ Verb left of Verb:           f g ⍵
     InvokeMonadicFn   ⍝ Invoke g monadically
 :Case Std             ⍝ Verb left of dyadic fn
     InvokeDyadicFn
 :Case Stx             ⍝ Verb left of expn:           f ⍵
     k←Push Stf
     PushCursor i      ⍝ Push cursor past verb
 :Case StC             ⍝ Verb left of dyadic conj:    f +.× ⍵
     snfC
 :Case StA             ⍝ Verb left of naked adverb:   f /
     PushCursor Push StV  ⍝ Now have naked derived fn f/
 :Case StN             ⍝ Verb left of niladic fn:     f ⎕ts
     InvokeNiladicFn Stx ⍝ Execute niladic verb
 ⍝ todo: write :case StA, Sta, Stl
 :CaseList Sto,Stc     ⍝ Verb left of adverb or conj: f ?help
     snfo
 :Else
     snerr
 :EndSelect
