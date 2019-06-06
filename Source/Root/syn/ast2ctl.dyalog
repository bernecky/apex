 ast2ctl
⍝ Control structure (:if :for, etc.) left of anything
 :Select state
 :Case Stn           ⍝ ctl struct left of bos
     snkn
 :Case Stf           ⍝ ctl struct left of fn:          :if f ⍵
     InvokeMonadicFn
 :Case Stx           ⍝ ctl struct left of expn:        :if ⍵
     snkx
 :Case Std           ⍝ ctl struct left of dyadic fn:   :if ⍺ f ⍵
     InvokeDyadicFn
 :Case StN           ⍝ ctl struct left of niladic fn:  :if NiladicFn
     InvokeNiladicFn Stx
 :EndSelect
