﻿ r←dfaDsf y;ast;wl;i;k;m;n;b;args;rnks;astr;nsa;j;cv
 ⍝ Handle dyadic scalar functions.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(~ast[;astlarg]∊NULL)∧ast[;astfn]∊ER1 ⍪'+-÷×*○⌈⌊⍟|~≤=≥⍟≠<>∧∨⍱⍲'
 wl←wl∧~i ⍝ Mark work done
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 ⍝ We could only handle if we knew both args, but
 ⍝ Either one non-singleton is adequate for
 ⍝ decision (unless length/rank error).
 astr←i⌿ast
 :If 1∊i ⍝ any work?
     args←D astr[;astlarg,astrarg] ⍝ Locate left and rt args.
     rnks←ast[args;astrank]
     m←∧/~rnks∊NULL                ⍝ Both ranks known, please.
     k←m⌿rnks
 ⍝ Ranks match or singleton extension
     astr[m/⍳⍴m;astrank]←ER0⌈/D k ⍝ result rank.
 ⍝ Most result types are max of argument types.
 ⍝ We only set if we know both sides.
     k←ast[D astr[;astlarg,astrarg];asttype] ⍝ ⍺, ⍵ types.
     m←∧/~k∊NULL
     n←⌈/asttypeB,m⌿k
     astr[m/⍳⍴m;asttype]←n ⍝ Normal type.
 ⍝ Some ops have minimum int result type, e.g., Bool+Bool
     b←m∧astr[;astfn]∊ER1 ⍪'+-÷'
     b←b/⍳⍴b
     astr[b;asttype]←⌈/asttypeI,astr[b;,asttype]
     astr[(astr[;astfn]∊ER1 ⍪'÷⍟○')/⍳1↑⍴astr;asttype]←asttypeD ⍝ floats
     astr[(astr[;astfn]∊ER1 ⍪'<≤=≥>≠∨∧⍱⍲')/⍳1↑⍴astr;asttype]←asttypeB
     astr[;astshape]←k←ast dfadsfShape i/⍳⍴i ⍝ Result shape
     b←(~k∊NULL)/⍳⍴k              ⍝ Set known ones only
     :If ×⍴b                      ⍝ Stupid APL2 empty arrays
         astr[b;astxrho]←xrho¨k[b]   ⍝ Result xrho
     :EndIf
 ⍝ Some partial evaluation can be done here!
     astr[;astPred]←E astPredLen⍴0 ⍝ Kill all predicates
     k←astmerge(E ast),(E astr),E i
     ast←D k[0] ⋄ wl←wl∨D k[1]
     ast←i dsfShapeClique ast
 :EndIf ⍝ no work
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
