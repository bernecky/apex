BuildStrandAssigns←{
  (ast inout astp)←⍺
  nms←⍵[;Stkvalue] ⍝ b c d
  ⍝ In vs Out
  sgi←ast[dfnname;asttarget] ⍝ foo
  sgi←sgi,¨( '_sgo' '_sgi')[inout],¨⍕¨⍪⍳≢⍵  ⍝ E.g., foo_sgi42 foo_sgo666
  (ast sgi)←ast MakeVardecs sgi
  astr←astNewRows ≢⍵
  astp←astp+≢⍵
  astr[;asttarget]← (sgi,⍪nms)[;inout]
  astr[;astrarg]← (nms,⍪sgi)[;inout]
  astr[;astfn]←E Copy
  astr[;astclass]←astclassVARB
  ⍝⍝ ??astr[;astscope]←(astscopeSGO astscopeSGI)[inout]
  astr[;astscope]←0 ⍝ Not sure why CheckSGIOOne complains
  ( ast astr astp)
 }

