StrandSemiGlobalNames←{
  inout←⍺ ⍝ i or o
  (subfn sz)←⍵
  subfn,¨(E'_sg',inout),¨⍕¨⍪⍳sz  ⍝ E.g., foo_sgi42 foo_sgo666
}

