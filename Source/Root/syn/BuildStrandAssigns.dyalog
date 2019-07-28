BuildStrandAssigns←{
  (ast inout stk)←⍵
  nms←⍺ ⍝ b c d
  sgi←ast[dfnname;asttarget] ⍝ foo
  ⍝ inout: 0 if out; 1 if in 
  sgi←sgi,¨( '_sgo' '_sgi')[inout],¨⍕¨⍪⍳≢nms  ⍝ E.g., foo_sgi42 foo_sgo666
  st←StackPop 3+⍴nms ⍝ Pop nms, ( ) and the fn
  stk←stk StackPush st[2 0;] ⍝ Push (fn dummyarg)
  (ast stk sgi)←(ast stk) MakeVardecs sgi
  astr←astNewRows ≢nms
  astr[;asttarget]← (sgi,⍪nms)[;inout]
  astr[;astrarg]← (nms,⍪sgi)[;inout]
  astr[;astfn]←E Copy
  astr[;astclass]←astclassVARB
  ⍝⍝ ??astr[;astscope]←(astscopeSGO astscopeSGI)[inout]
  astr[;astscope]←0 ⍝ Not sure why CheckSGIOOne complains
  ( ast astr stk)
 }

