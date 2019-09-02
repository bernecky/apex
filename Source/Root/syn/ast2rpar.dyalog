﻿ ast2rpar
⍝ Right parenthesis left of anything
 :Select state
 :CaseList Stx,Stl,Sto,Stn,Stf
                       ⍝ Rpar left of expn:       ...rank(2) ⍵
                       ⍝ Rpar left of left bkt:   (...)[0]
                       ⍝ Rpar left of adverb:     (~s)/⍵
                       ⍝ Rpar left of bos:       ...)
                       ⍝ Rpar left of fn:        f) ???
     PushCursor Push Stn
 :Case Sta ⍝ )←   Strand if we have (x y z)←( b c d)
     PushCursor Push Stn
 :Case StS             ⍝ Rpar left of strand. Deal with (...)
     PushCursor Push Stn
 ⍝ Need Sto,Std,StV,StC,StA
 :Else
     snerr
 :EndSelect
