 r←dfaReshape y;ast;wl;i;j;k;b;m;t;astr;p;v
 ⍝ Handle reshape.
 ast←D y[ssaast]
 Checkem y
 wl←D y[ssacv]
 i←ast[;astfn]∊ER1⍪'⍴'   ⍝ Reshape only
 i←wl∧i∧~ast[;astlarg]∊NULL ⍝ Dyadics only.
 wl←wl∧~i
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 ⍝ Result rank is ⍴⍺, result shape is ⍺.
 :If 1∊i ⍝ Any work?
     astr←i⌿ast ⍝ Affected rows.
     k←D astr[;astlarg,astrarg] ⍝ Arguments.
     astr[;asttype]←ast[k[;1];asttype] ⍝ Result type is ⍵ type.
 ⍝ Set rank and shape if we know them.
     b←~ast[k[;0];astshape]∊NULL
     j←ast[b/k[;0];astxrho] ⍝ Larg element count is
     astr[b/⍳⍴b;astrank]←j ⍝ result rank
 ⍝ Result rank is ⍴,⍺
 ⍝ Can't know value without knowing shape
     m←ast[k[;0];astvalue] ⍝ Result shape is ravel of value
     t←ast KnowValue k[;0]
     b←b∧t
     :If 1∊b                   ⍝ Stupid APL2 prototypes
         v←quadfi¨,¨b/m           ⍝ Result shape
         astr[b/⍳⍴b;astshape]←v
     :EndIf
 ⍝ Maintain predicates.
     p←astPredLen⍴0
     p[astPredAll2,astPredNonNeg,astPredInteger]←1
     m←D ast[k[;1];astPred]
     astr[;astPred]←ER1 m∧(⍴m)⍴p
     j←astmerge(E ast),(E astr),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
 Checkem r
