 ast2lpar;newsignal
⍝ Left parenthesis left of anything
 :Select state
 :Case Stf         ⍝ lpar left of fn:         (f ⍵
     InvokeMonadicFn
     newsignal←PopParenthesis
 :Case Stx         ⍝ lpar left of expn:       (⍵
                   ⍝ Perhaps strand on lhs? (a b c)←⍵
                   ⍝ or strand on rhs foo( a b c)
     snPx
     newsignal←clsexpn
 :Case Std         ⍝ lpar left of dyadic fn:  (⍺ f ⍵) b c d 
     InvokeDyadicFn
     newsignal←PopParenthesis ⍝ Now have z b c d
     newsignal←clsexpn
 :Case StV         ⍝ lpar left of naked adv:  ( /
                   ⍝ lpar left of monadic fn: ( monfn) ⍵
     newsignal←PopParenthesis
     newsignal←clsexpn
 :Case StC         ⍝ lpar left of naked conj: ( +.×
     snPC
 :Case StN         ⍝ lpar left of niladic fn: (NiladicFn)
     InvokeNiladicFn Stx
     newsignal←PopParenthesis
     newsignal←clsexpn
 :Case Sto
     ÷0 ⍝ FIXME
 :Case StA
     ÷0 ⍝ FIXME
 :Else
     snerr
 :EndSelect

