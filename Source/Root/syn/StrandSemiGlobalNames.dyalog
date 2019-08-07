StrandSemiGlobalNames←{
  setref←⍺
  (subfn sz)←⍵
  subfn,¨( '_sgo' '_sgi')[setref],¨⍕¨⍪⍳sz  ⍝ E.g., foo_sgi42 foo_sgo666
}

