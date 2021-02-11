 snif;i
 ⍝ State is function, signal is identifier.
 ⍝ If the identifier is a fn w/argument, execute the
 ⍝ stacked fn monadically
 i←c gett(E src),E tok
 :Select D ast[D i[GettValue];astclass]
 :CaseList astclassMFN,astclassDFN
     InvokeMonadicFn ⍝ monadic or dyadic fn left of fn
 :Case astclassNFN   ⍝ Niladic fn left of fn:  ⎕av⍳⍵
     i←Push state ⍝ Stack niladic fn
     InvokeNiladicFn Stx          ⍝ then execute it
     state←Std
     PushCursor i
 :CaseList astclassVARB,NULL  ⍝ Varb/undef left of fn
     PushCursor Push Std
 :Else
     snerr
 :EndSelect
