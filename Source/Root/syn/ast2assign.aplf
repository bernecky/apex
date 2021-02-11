 ast2assign
⍝ Assignment arrow to left of anything
 :Select state
 :Case Stn,Stz ⍝ New statement or error
     snerr
 ⍝
 :Case Stf     ⍝ Assign left of function (x←f ⍵)
     InvokeFn
 :Case StN     ⍝ Assign left of niladic function (x←NiladicFn)
     InvokeNiladicFn Stx
 :Case Stx     ⍝ Assign left of expression (x←⍵)
     snax
 :Case Sta     ⍝ Assign left of left bracket (←[...])
     snaa÷0 ⍝ Very wrong
 :Case Sto     ⍝ Assign left of operator ????
     snao÷0
 :Case StS     ⍝ Assign left of strand
     PushCursor Push Sta ⍝ Push assign so have ←(b c d)
 :Case Stz     ⍝ Assign left of error
     snerr
 :Case Std     ⍝ Assign left of dyadic fn and argument (x←⍺ f ⍵)
     InvokeDyadicFn
 :Case StV     ⍝ Assign left of naked verb (x←f)
     snaV
 :Case StC     ⍝ Assign left of naked conj (x←.)
     snaC
 :Case StA     ⍝ Assign left of naked adverb (x←/)
     snaA
 :Else
     snerr     ⍝ Syntax error or syntax analyzer bug
 :EndSelect
