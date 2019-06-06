 ast2conj
⍝ Conjunction left of anything
 :Select state
 :Case Stf               ⍝ Conj left of Verb:  .g ⍵
     PushCursor Push Sto ⍝ Push conj
 :Case Stx               ⍝ Conj left of expn: e.g., rank ⍤0 1 ⍵
     PushCursor Push Sto ⍝ Push conj
 :Case Std               ⍝ Conj left of dyadic fn w/stacked args: ⍺ f⍵
                         ⍝ E.g., f⍤dimx ⊢ y
     InvokeMonadicFn     ⍝ Emit tmp← ⊢ y and stack tmp
     PushCursor Push Sto ⍝ Push conj
 :Else
     snerr
 :EndSelect
