 r←DeadVarbRemoval cds;ast;cv;cv2
⍝# Remove dead varbs from ast
 ast←D cds[ssaast]
 cv←~dfainit ast
 cv[¯1+cv⍳0]←0                        ⍝ Don't kill end marker
 cv[dfnname,dfnres,dfnlarg,dfnrarg]←0 ⍝ Don't kill fixed area
 cv2←~(cv/⍳⍴cv)∊ast[;astptrs]         ⍝ The Undead
 cv←~cv\cv2
 ast←cv⌿(¯1++\cv)RenumberAst ast
 r←cds
⍝⍝⍝r[ssaast]←E ast  ⍝ needs work. Only symbol table part disappears...
 r[ssacv,ssabb]←E'?'
