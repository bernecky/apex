 r←dfaRepresentType ast;b;p
⍝ Get result type for x⊤y
⍝ This is maxtype, except when x is
⍝ all 2s, in which case it's boolean
⍝ We know both types here, so NULL is not
⍝ a problem
 r←ast[;0;,asttype]maxtype ast[;1;,asttype] ⍝ Usual result type
 :If ~0∊⍴ast         ⍝ Any work?
     p←D ast[;0;astPred] ⍝ Look at x
     b←p[;astPredAll2]
   ⍝ Is it n⍴2? If so, result type is boolean
   ⍝ We can exploit knowledge of left argument being
   ⍝ all 2's, even though we don't know how many there
   ⍝ are.
     r[b/⍳⍴b]←E Types⍳'b'
 :EndIf
