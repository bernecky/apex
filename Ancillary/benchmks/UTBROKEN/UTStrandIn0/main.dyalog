 r←main;outerval1;r1
⍝ Test innocent parens
⍝ This is a degenerate case where we end up with no strands.
 r← (42)+(666)
 ⎕←r
 ⎕←r←1-r≡ 708
