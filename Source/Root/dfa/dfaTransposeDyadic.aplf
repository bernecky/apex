 r←dfaTransposeDyadic y;ast;wl;i;j;k;newrows;m;la;n;p
 ⍝ Handle dyadic transpose
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊E,'⍉')∧~IsMonadic ast
 wl←wl∧~i
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
  ⍝ Find left argument. We must know its value!
     m←i\~(i⌿ast[;astlarg])∊NULL  ⍝ Dyadic only, please
     la←ast[,D m⌿ast[;astlarg];] ⍝ Left args
     :If ~0∊⍴la ⍝ Anywork
         m←m\j←(D la[;astPred])[;astPredKnowValue]
         newrows←m⌿ast
         :If ~0∊⍴newrows ⍝ Any work?
             k←,D newrows[;astrarg] ⍝ Right argument
    ⍝ Result type same as right argument
             newrows[;asttype]←ast[k;asttype]
    ⍝ Result rank is ⍴nub left arg, but scalar
    ⍝ This code is really retarded: At present, it
    ⍝ has to know the value of the left argument.
    ⍝ E.g., "(⍳0)⍉5" will cause an error in next
    ⍝ line's quadfi call. Also, I probably don't
    ⍝ deal with ⎕ct. FIXME
             newrows[;astrank]←(E⍳0)⍴¨⍴¨nub¨quadfi¨la[;astvalue]
    ⍝ Mark Predicates to be preserved
             n←astPredLen⍴0
             n[astPredAll2,astPredPVSubset,astPredNoDups]←1
             n[astPredInteger,astPredNonNeg]←1
             p←D ast[k;astPred]
             n←p∧(⍴p)⍴n ⍝ Kill all other Preds
             p←p[;astPredPV]∨n[;astPredPVSubset] ⍝ PV becomes PVSubset
             n[;astPredPVSubset]←p
             newrows[;astPred]←ER1 n
    ⍝ Result shape is arg shape (when known) indexed by
    ⍝ left argument (when known)
             j←j∧~ast[k;astshape]∊NULL
             n←(quadfi¨j/la[;astvalue])PickEachLeft¨ast[j/k;astshape]
             newrows[j/⍳⍴j;astshape]←n
             j←astmerge(E ast),(E newrows),E m
             ast←D j[0] ⋄ wl←wl∨D j[1]
         :EndIf
     :EndIf
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
