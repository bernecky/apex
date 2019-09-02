﻿ ast2expn;astr
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
 :Case Sta           ⍝ Strand left of assign:       (b c d)←omega
     ⍝ Maybe this should be in snax?
     'Stack confusion'assert 2=stkp
     ⍝ If we had (val1)←omega, it turned into val1←omeg
     ⍝ If not, I am confused
     astr←,astNewRows 1
     astr[asttarget]←Stkvalue⌷,StackPop 1
     astr[astrarg]←Stkvalue⌷,StackCopy 1
     astr[astfn]←E astfnCopy
     astr[astclass]←astclassVARB
     ast←ast append2Ast astr
     state←Stx
 :Case Stx           ⍝ Expression left of expression ((x foo y) c d)
     snxx            ⍝ Stranded again...
     ⍝ Above may be wrong now that we have StS
 :Case StS
     PushCursor Push StS ⍝ Prepend expn to strand
 :Else
     snerr
 :EndSelect
