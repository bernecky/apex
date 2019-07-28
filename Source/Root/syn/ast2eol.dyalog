﻿ ast2eol
⍝ End of line left of anything
 :Select state
 :Case Stf     ⍝ eol left of monadic 
     InvokeMonadicFn
 :Case Std     ⍝ eol left of dyadic fn   ⍺ f ⍵
     InvokeDyadicFn
 :Case StN     ⍝ eol left of niladic fn ⎕ts
     InvokeNiladicFn Stx
 :Case Stx     ⍝ eol left of expn 
     ⍝ Should we print this?
 :Else
     snerr
 :EndSelect
