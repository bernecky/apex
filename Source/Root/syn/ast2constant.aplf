 ast2constant
⍝ Constant to left of anything
 :Select state
 :CaseList Stn,Stf ⍝ Constant left of new statement or function
     snnn         ⍝ 'foo' or ('foo' f ...)
 ⍝
 :Case Stx     ⍝ Constant left of expression
     snnx
 :Case Stl     ⍝ Constant left of left bracket ('foo'[1 2])
     sncl
 :Case Sto     ⍝ Constant left of operator
     snno
 :Case Stz     ⍝ Constant left of error
     snerr
 :Case Std     ⍝ Constant left of dyadic fn w/argument (x←⍺ f ⍵)
     InvokeDyadicFn
     snnx           ⍝ Now, treat as constant left of expression
 :Case StV     ⍝ Constant left of naked verb (x←f)
     snerr
 :CaseList StC,StA ⍝ Constant left of naked conj (x←.) or adverb(x←/)
     snerr
 :Case StS     ⍝ Constant left of strand
     PushCursor Push StS ⍝ Extend strand with constant
 :Else
     snerr        ⍝ Syntax error or syntax analyzer bug
 :EndSelect
