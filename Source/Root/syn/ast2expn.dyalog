 ast2expn
⍝ Expression left of anything
 :Select state
 :Case Stn           ⍝ Expn left of bos:          (⍵)
                     ⍝ bos≡Beginning Of Statement
     state←Stx
 :Case Stf           ⍝ Expn left of fn:           (⍺) f ⍵
     snxf
 :Case Stl           ⍝ Expn left of left bracket: (⍺)[⍵]
     snxl
 :Case Sto           ⍝ Expn left of adverb:       (⍺)+/⍵
     state←Stf
 :Case Std           ⍝ Expn left of conj:         (⍺)+.×⍵
     InvokeDyadicFn
 :Case StC           ⍝ Expn left of naked conj:   (⍺)+.×
     snxC
 :Case Sta           ⍝ Expn left of assign:       (b c d)←omega
     snxxxxx            ⍝ Strand assignment in called fn
 :Case Stx           ⍝ Expression left of expression ((x foo y) c d)
     snxx            ⍝ Stranded again...
 :Else
     snerr
 :EndSelect
