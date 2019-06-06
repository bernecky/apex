 astpush y;i;j;p
 ⍝ Push y onto ast.
 j←mm y
 p←j[;astlarg,astrarg]
 :If 0∊(p∊NULL)∨(p<1↑⍴ast)∧(p≥0)
     ⎕←'Non-pointer in astlarg, astrarg'
 :EndIf
 j[;aststmt]←E lineno ⍝ No line #s today
 j[;asttoken]←E c     ⍝ Column # of token
 i←''⍴⍴j
 ast[astp+⍳1↑⍴j;]←j
 astp←astp+i
