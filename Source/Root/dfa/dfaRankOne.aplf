 r←c dfaRankOne y;ast;rop;lh;rh;i;j;lr;rr;astr;wl;tar;fl;fr;cv
 ⍝ Handle rank conjunction at ast[c;]
 ast←D y[ssaast]
 wl←D y[ssacv]
 rop←D ast[c;astrop] ⍝ Rank values
 lh←D ast[c;astlarg]
 rh←D ast[c;astrarg]
 ⍝ Today, we support only 1 or 2-element non-negative
 ⍝ known rank values.
 ⍝ This code sets up :PA for f in f/⍵ and ⍺ f/⍵.
 ⍝ It then (on one or more later passes) extracts
 ⍝ the morphology from the f call.
 :If 0∊(D ast[rop;astPred])[astPredKnowValue]
     ⎕←'Rank conj right operand not constant'
 :EndIf
 :If ~∧/ast[rop;astshape]∊(E,1),(E,2),E⍳0
     ⎕←'Coding time for rank conj operand shape'
 :EndIf
 (lr rr)i←2⍴D quadfi¨ast[rop;astvalue] ⍝ Get cell ranks
 ⍝ Fill in subfunction's morphology.
 astr←ast[c+1 2;] ⍝ Parameters to operand fn
 'Expected :PA entries after rank conjunction'assert∧/astr[;astfn]∊E':PA'
 :If ~lh∊NULL
     astr[0;astchar]←ast[lh;astchar] ⍝ :PA
 :EndIf
 astr[1;astchar]←ast[rh;astchar] ⍝ :PA
 rr←rr⌊D ast[rh;astrank] ⍝ Effective right rank

 astr[;astshape,astxrho,astvalue]←E NULL
 astr[;astscope]←E NULL
 ⍝ Most predicates are still ok. We kill
 ⍝ these for now, until we get the analysis working.
 i←D astr[;astPred]
 i[;astPredPV,astPredKnowValue]←0
 astr[;astPred]←ER1 i
 tar←D ast[c;astlop] ⍝ Invocation of f
 ⍝ f's argument ranks are astrop ⌊ our ranks
 :If ~lh∊NULL ⍝ Dyadic
     astr[0;astrank]←lr⌊D ast[D ast[c;astlarg];astrank]
 :EndIf
 astr[1;astrank]←rr⌊D ast[D ast[c;astrarg];astrank]
 ⍝ Should fill in astxrho, astshape, astvalue, when known 1996-06-08
 j←astmerge(E ast),(E astr),E(⍳⍴wl)∊ast[tar;astlarg,astrarg]
 ast←D j[0] ⋄ wl←wl∨D j[1]
 wl[tar]←1 ⍝ Do dfa on the operand
 ⍝ Now (assuming we're on a later pass...) extract morphology
 ⍝ rank expression result rank is shape of lamination of cells
 astr←ast[,c;] ⍝ The rank expression an sich
 astr[;asttype]←ast[tar;asttype] ⍝ Result type from operand

⍝ Try to compute right frame rank, left frame rank (if dyadic call)
 :If (~ast[tar;astrank]∊NULL)∧(~ast[c;astrarg]∊NULL)
     fr←0⌈(D ast[D ast[c;astrarg];astrank])-rr ⍝ Right frame rank
 :EndIf

 :If (~ast[tar;astrank]∊NULL)∧(~ast[c;astlarg]∊NULL)∧(~ast[c;astrarg]∊NULL)
     fl←0⌈(D ast[D ast[c;astlarg];astrank])-lr ⍝ Left frame rank
     astr[;astrank]←E(D ast[tar;astrank])+fl⌈fr ⍝ Result rank
 :EndIf

 ⍝ Most outbound predicates killed by result lamination.
 ⍝ Could fancy up some in future.
 i←astPredLen⍴0
 i[astPredNonNeg,astPredAll2,astPredInteger]←1 ⍝ Preserve these incoming
 i←i∧D ast[tar;astPred]
 astr[;astPred]←E i
 ⍝ Set result shape if known (someday)
 j←astmerge(E ast),(E astr),E(⍳⍴wl)∊c
 ast←D j[0] ⋄ wl←wl∨D j[1]
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
