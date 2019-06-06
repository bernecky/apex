 ast2semic
⍝ Semicolon left of anything
 :Select state
 :Case Stn          ⍝ semic left of bos:    x[;i] x[i;]
     PushCursor IndexNull Push Stn
 :Case Stf          ⍝ semic left of fn:     x[;f ⍵]
     InvokeMonadicFn
 :Case Stx          ⍝ semic left of expn:   x[;(2)]
     state←Stn
     PushCursor c gett(E src),E tok
 :Case Std          ⍝ semic left of dyad:   x[;⍺ f ⍵]
     InvokeDyadicFn
 :Case StN          ⍝ semic left of NiladicFn:   x[;NiladicFn]
     InvokeNiladicFn Stx
 :Else
     snerr
 :EndSelect
