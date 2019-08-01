BuildStrandAssigns←{
  (ast inout stk)←⍵
  nms←⍺ ⍝ b c d
  ⍝ inout: 0 if out; 1 if in 
  sgi←inout StrandSemiGlobalNames (ast (≢nms)) ⍝ E.g., foo_sgi42 foo_sgo666
  ⍝⍝ st←StackPop 3+⍴nms ⍝ Pop nms, ( ) and the fn
  ⍝⍝ stk←stk StackPush st[2 0;] ⍝ Push (fn dummyarg)
  (ast stk sgi)←(ast stk) MakeVardecs sgi
  astr←astNewRows ≢nms
  astr[;inout⌽astrarg,asttarget]← sgi,⍪nms
  astr[;astfn]←E astfnCopy
  astr[;astclass]←astclassVARB
  astr[;astscope]←0
  ( ast astr stk)
 }

