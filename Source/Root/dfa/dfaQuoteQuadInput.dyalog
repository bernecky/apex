﻿ r←dfaQuoteQuadInput y;ast;wl;i;nast;j
 ⍝ Quote-quad input produces character vector result
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E'←⍞'
 i←i∧ast[;astlarg]∊NULL ⍝ Monadic only, please.
 wl←wl∧~i ⍝ Update worklist
 :If 1∊i ⍝ Any work?
     nast←i⌿ast
     nast[;astrank]←E 1
     nast[;asttype]←E asttypeC
     j←astmerge(E ast),(E nast),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
