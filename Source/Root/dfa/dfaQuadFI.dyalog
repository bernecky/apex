﻿ r←dfaQuadFI y;ast;wl;i;tar;nast;j;nms
 ⍝ ⎕fi, ⎕vi for SHARP APL
 ast←D y[ssaast]
 wl←D y[ssacv]
 nms←(E'⎕fi'),(E'⎕vi')
 i←wl∧ast[;astfn]∊nms
 i←i∧ast[;astlarg]∊NULL ⍝ Monadic only, please.
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     nast←i⌿ast
     nast[;astrank]←E 1
     nast[;asttype]←((E asttypeD),E asttypeB)[nms⍳nast[;astfn]]
  ⍝ Above ⎕fi double type is unfortunate, but have to pick worst case
     j←astmerge(E ast),(E nast),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
