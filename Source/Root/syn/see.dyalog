 x see y;i;j;k;s;st;row
⍝⍝ FIXME later SyntaxAnalyzerInit
 ⎕←'state=',state,',signal=',D stk[stkp;Stkstate]
 c seecs(E x),E y
 s←(E'Stkstate'),(E'Stkvalue'),(E'StkValueName'),E'Stktokcl'
 st←((stkp+1),¯1↑⍴stk)↑stk
 st←st[;0 1],(ast TargetName st[;,1]),st[;,2]
 ⎕←(E'Stack: '),E(mcb(-stkp+1)⌽(stkp+2)↑E'->'),s⍪st
 row←≢ast
 j←(row,¯1↑⍴ast)↑ast
 k←j[;astlarg]∊ER0⍳1↑⍴st
 j[k/⍳⍴k;astlarg]←st[,D k/j[;astlarg];0]
 k←j[;astrarg]∊ER0⍳1↑⍴st
 j[k/⍳⍴k;astrarg]←st[,D k/j[;astrarg];0]
 k←j[;asttarget]∊ER0⍳1↑⍴st
 j[k/⍳⍴k;asttarget]←st[,D k/j[;asttarget];0]
 i←E(mcb(-row)⌽(row+1)↑E'->'),j⍪E' '
 ⍝⍝⍝'Ast: ',E((E'<[>,I3,<]>' ⎕fmt⍳row+1),i),E st
