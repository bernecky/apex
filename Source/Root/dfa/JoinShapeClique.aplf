 r←ast JoinShapeClique LR;i;rownum;cv;cln
⍝ Join shape cliques. Each row of LR is a pair
⍝ of ast indices to join. We pick lower clique value, arbitrarily.
⍝ Clique of first column set to clique of second.
 cln←ast[LR;astShapeClique]  ⍝ Clique #s
⍝ LR may have one or more duplicate clique values across rows.
⍝ If so, we join them in next few lines.
 cv←ast[;astShapeClique]∊cln
 rownum←floor((,cln)⍳cv/ast[;astShapeClique])÷¯1↑⍴LR
 i←(LR[;1])[rownum]
 r←ast
 r[cv/⍳⍴cv;astShapeClique]←r[i;astShapeClique]
