﻿ r←GetTokenClass stkentry
 ⍝ Get the token class for a stack entry.
 r←stkentry[Stktokcl] ⍝ If primitive, then it's the token class
 :If clsid=r
     r←ast[D stkentry[Stkvalue];astclass]
     ⍝ Map astclass to token class
     :If r∊astclassNFN,astclassMFN,astclassDFN
         r←clsfn
     :ElseIf r∊astclassVARB ⍝ May be strand
         r←clsid
     :Else
         ÷0 ⍝ Confusions
     :EndIf
 :EndIf
