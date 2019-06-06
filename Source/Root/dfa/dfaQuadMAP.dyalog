 r←dfaQuadMAP y;ast;wl;i;tar;nast;j;nms
 ⍝  z←83 ¯1 ⎕map filename  ⍝ Dyalog APL only
 ⍝ Today, the result is an 8-bit integer vector
 ast←D y[ssaast]
 wl←D y[ssacv]
 nms←E'⎕map'
 i←wl∧ast[;astfn]∊nms
 i←i∧~ast[;astlarg]∊NULL ⍝ Dyadic only, please.
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     nast←i⌿ast
     nast[;astrank]←E 1
     ⍝ result shape is unknown
     nast[;asttype]←E asttypeI
     j←astmerge(E ast),(E nast),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
