 ast2rbr
⍝ Right bracket left of anything
 :Select state
 :CaseList Stn,Stf,Sta,Sto     ⍝ rbr left of bos, fn, adv, conj  ...[i]
     PushCursor Push Stn       ⍝ Now bos
 :Case Stl                     ⍝ rbr left of lbr: (3 3⍴1)[2;][1]
     PushCursor Push Stn
 :Else
     snerr
 :EndSelect
