StrandSemiGlobalNames←{
  inout←⍺
  (ast sz)←⍵
  fn←ast[dfnname;asttarget]
  fn,¨( '_sgo' '_sgi')[inout],¨⍕¨⍪⍳sz  ⍝ E.g., foo_sgi42 foo_sgo666
}

