 ast2goto
⍝ GOTO (branch arrow) left of anything
 :Select state
 :CaseList Stn         ⍝ GOTO left of bos:         →
     sngn
 :Case Stf             ⍝ GOTO left of fn:          →f ⍵
     sngf
 :Case Stx             ⍝ GOTO left of expn:        →⍵
     sngx
 :Case Std             ⍝ GOTO left of dyadic fn:   →⍺ f ⍵
     sngd
 :Else
     snerr
 :EndSelect
