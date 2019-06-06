 ast2lpar
⍝ Left parenthesis left of anything
 :Select state
 :Case Stf         ⍝ lpar left of fn:         (f ⍵
     InvokeMonadicFn
     PopParenthesis
 :Case Stx         ⍝ lpar left of expn:       (⍵
     snPx
 :Case Std         ⍝ lpar left of dyadic fn:  (⍺ f ⍵
     InvokeDyadicFn
     ⍝⍝⍝ ?? PopParenthesis
     ⍝⍝⍝ ?? signal←clslpar ⍝ Now have ( x x x)
 :Case StV         ⍝ lpar left of naked adv:  ( /
                   ⍝ lpar left of monadic fn: ( monfn) ⍵
     PopParenthesis
 :Case StC         ⍝ lpar left of naked conj: ( +.×
     snPC
 :Case StN         ⍝ lpar left of niladic fn: (NiladicFn)
     InvokeNiladicFn Stx
     PopParenthesis
 :Case Sto
     ÷0 ⍝ FIXME
 :Case StA
     ÷0 ⍝ FIXME
 :Else
     snerr
 :EndSelect
