BuildStrandAssigns←{
  (ast setref stk subfn)←⍵
  nms←⍺ ⍝ b c d
  ⍝ setref: 0 if out; 1 if in 

  ⍝ E.g.,strand is (A B); sgi is: foo_sgi42 foo_sgo666
  ⍝ setref←1 gives A←foo_sgi42    B←foo_sgo666
  ⍝ setref←0 gives foo_sgi42←A    foo_sgo666←B
  sgi←setref StrandSemiGlobalNames (subfn (≢nms)) 
  ⍝⍝ st←StackPop 3+⍴nms ⍝ Pop nms, ( ) and the fn
  ⍝⍝ stk←stk StackPush st[2 0;] ⍝ Push (fn dummyarg)
  (ast stk sgi)←(ast stk (astscopeSGI+astscopeSGO)) MakeVardecs sgi
  astr←astNewRows ≢nms
  astr[;setref⌽astrarg,asttarget]← nms,⍪sgi
  astr[;astfn]←E astfnCopy
  astr[;astclass]←astclassVARB
  astr[;astscope]←astscopeSGI+astscopeSGO
  ( ast astr stk)
 }

