StrandSemiGlobalNames←{
  inout←⍺
  (subfn sz)←⍵
  subfn,¨( '_sgo' '_sgi')[inout],¨⍕¨⍪⍳sz  ⍝ E.g., foo_sgi42 foo_sgo666
}

