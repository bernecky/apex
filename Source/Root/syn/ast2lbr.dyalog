﻿ ast2lbr
⍝ Left bracket left of anything
 :Select state
 :Case Stn     ⍝ lbr left of bos         x[;⍵]  x[]
     j←IndexNull Push Stn ⍝ Stack a hole
 :Case Stf     ⍝ lbr left of fn          x[f ⍵]
     InvokeMonadicFn
 :Case Stx     ⍝ lbr left of expn        x[⍵]
 :Case Std     ⍝ lbr left of dyadic fn   x[⍺ f ⍵]
     InvokeDyadicFn
 :Case StN     ⍝ lbr left of niladic fn  x[⎕ts]
     InvokeNiladicFn Stx
 :Else
     snerr
 :EndSelect
 snBx          ⍝ Generate index list from stacked indices
               ⍝ Actual indexing has to wait until we look further
