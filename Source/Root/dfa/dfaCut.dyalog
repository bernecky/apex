﻿ r←dfaCut y;ast;wl;i;j;rk;b;astb;m;cv;stcv;n;cv2;st
 ⍝ Handle cut conjunction
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊ER1⍪'⍤'
 ⍝ Segregate cut from rank.
 ⍝ Cut if astlop is numeric constant
 i←i∧(isnum ast[;astlop])∧~ast[;astlop]∊NULL
 j←,D(i⌿ast)[;astlop]
 i←i\ast[j;astclass]∊astclassNC
 j←,D i⌿ast[;astlarg] ⍝ Must know ⍺ rank.
 j←ast[j;astrank]
 i←i∧i\~j∊NULL
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 ⍝ Must know rarg & larg to proceed
 i←i∧∧/~ast[;astlarg,astrarg]∊NULL
 :If 1∊i ⍝ Any work?
 ⍝ Handle cut
     rk←i/ast[;astlop] ⍝The cut type
     'Nonce error; Limited cut domain'assert(quadfi¨ast[D rk;astvalue])∊E 3
 ⍝ Cannot replace cut w/fn & get same morphology.
 ⍝ The rank, shape, xrho may differ.
     astb←ast
     m←i/⍳⍴i
     astb[m;astlarg,astlop,astrop]←NULL
     astb[m;astchar]←(astNewRows⍴m)[;astchar] ⍝ "Don't know yet"
     astb[m;astfn]←ast[m;astrop]
     stcv←~dfainit astb ⍝Preserve symbol table
     cv←stcv∨cv2←(i∨stcv)ExtractSubFn astb ⍝ Get interesting bits.
     k←cv\⍳+/cv ⍝ New numbers
     astb←k RenumberAst astb
     astb←cv⍀dfa(E cv⌿astb),E st
 ⍝ Fix result rank if known.
     k←astb[m;astrank]
     b←(~k∊NULL)/⍳⍴k
     k[b]←k[b]+j[b]
     astb[m;astrank]←k
 ⍝ Merge dfa cut info
     cv2[m]←1
     astb[;astPred]←? ⍝ Maintain predicates
     j←astmerge(E ast),(E cv2⌿astb),E cv2
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
