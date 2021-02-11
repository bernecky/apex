 r←ast append2Ast astr;i;p;row
 ⍝ Append astr to ast
 astr←mm astr
 Checkem 2⍴E ast
 p←astr[;astlarg,astrarg]
 :If 0∊p∊NULL,⍳(≢ast)+≢astr
     ⎕←'Non-pointer in astlarg, astrarg'
 :EndIf
 astr[;aststmt]←E lineno ⍝ No line #s today
 astr[;asttoken]←E c     ⍝ Column # of token
 i←≢astr
 :If isTrace 'syn'
     ⎕←'Appending to ast: '
     ⎕←y
     ⎕←⍪src((¯1+-c)↑'^')
 :EndIf
 row←≢ast
 ast←ast⍪astNewRows i
 ast[row+⍳i;]←astr
 Checkem 2⍴E ast
 r←ast
