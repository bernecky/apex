 r←dfaQuadAV y;i;ast;wl;j;k;p
 ⍝ Set result type, rank, shape for ⎕av.
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E'⎕av'
 wl←wl∧~i ⍝ Mark work already done.
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     k←i⌿ast
     k[;asttype]←asttypeC
     k[;astrank]←E 1
     k[;astshape]←E,256
     k[;astvalue]←E ⎕AV ⍝ Here there be dragons 2005-07-02
     p←astPredLen⍴0 ⍝ Establish predicates
  ⍝ astPredKnowValue is a fraud, until we figure out how to
  ⍝ set it in AST properly.
     p[astPredPV,astPredNoDups,astPredKnowValue]←1
     k[;astPred]←E p
     j←astmerge(E ast),(E k),E i
     ast←D j[0]
     wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
