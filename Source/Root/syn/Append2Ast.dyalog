 Append2Ast astr;i;p
 ⍝ Append astr to ast. Extend ast if needed.
 astr←mm astr
 p←astr[;astlarg,astrarg]
 :If 0∊p∊NULL,⍳≢ast
     ⎕←'Non-pointer in astlarg, astrarg'
 :EndIf
 astr[;aststmt]←E lineno ⍝ No line #s today
 astr[;asttoken]←E c     ⍝ Column # of token
 i←≢astr
 :If trace
     ⎕←'Appending to ast: '
     ⎕←y
     ⎕←⍪src((-c)↑'^')
 :EndIf
 ast←ast⍪astNewRows i
 ast[astp+⍳i;]←astr
 astp←astp+i
 ast←astp↑ast ⍝ Trim
