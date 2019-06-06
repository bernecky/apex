 ast2id
⍝ Identifier left of anything
 :Select state
 :Case Stn                ⍝ Id left of bos:        ⍵
     snin
 :Case Stf                ⍝ Id left of fn:         ⍵ f...
     snif
 :Case Sto                ⍝ Id left of adverb:     ⍺/⍵
     PushCursor Push Stf  ⍝ Push lop; now function-ish
 :Case Std                ⍝ Id left of dyadic fn:  x ⍺ f ⍵
     InvokeDyadicFn
 :Case StC                ⍝ Id left of naked conj: ⍺ +.×
     sniC
 :Case StA                ⍝ Id left of naked adv:  ⍺ /
     sniA
 :Case Stx                ⍝ Id left of expression
     snix
 :Case Stl                ⍝ Id left of left bracket:  ⍺[...] or ⍺[...]←⍵
     snil
 :Case StN                ⍝ Id left of niladic fn: foo Niladicfn
     InvokeNiladicFn Stx
 :Case Sta                ⍝ Id (?) left of assignment (strand)
                          ⍝ I think this is for (b c d)←omega only
     ÷0

 :Else
     snerr
 :EndSelect
