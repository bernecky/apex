﻿ snis;i
 ⍝ Identifier left of strand
 ⍝ If the id is a defined verb, stack the verb.
 ⍝ Otherwise, syntax error.

⍝ Well, not really. We may have z←SumRavel⌺step ⊢omega
⍝                                          ↑ here
 i←c gett(E src),E tok ⍝ Get the identifier
 :Select ast[D i[GettValue];astclass]
 :CaseList astclassNFN,astclassMFN,astclassDFN,astclassnFN,astclassmFN,astclassdFN
     PushCursor Push Stf
 :Case astclassVARB ⍝ id left of expression, I.e., strand
     PushCursor Push Stx
 :Else
     'Source program syntax error: Identifier not function' assert 0
 :EndSelect
