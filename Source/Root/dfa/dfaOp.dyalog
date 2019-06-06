 r←dfaOp y;ast;wl;i;j;k;m;n;pa;larg;rarg;nast;op;upd;grank;glarg;grarg;lrank
 ⍝# Outer product dataflow analysis z←x ∘.g y
 ⍝# We define outer product as "x g rank (0 ¯) y"
 ast←D y[ssaast]
 wl←D y[ssacv]
 wl←wl∧~ast[;astfn]∊E,'∘'
 i←wl∧ast[;astfn]∊E,'.'
 op←i FindOperands ast
 k←ast[op[;0];astfn]∊E,'∘'
 i←i\k
 op←k⌿op
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
  ⍝ Propagate outer product argument info into g.
     pa←ast FindPA(E astrop),E i/⍳⍴i ⍝ Find PA entries for g
     larg←D i⌿ast[;astlarg]                   ⍝ ∘.g Arguments
     rarg←D i⌿ast[;astrarg]
     nast←ast
     glarg←pa[;0]                             ⍝ g left arg
     grarg←pa[;1]                             ⍝ g right arg
     nast[glarg;astrank]←E 0                  ⍝ Left arg of g is rank-0
     nast[grarg;astrank]←ast[rarg;astrank]    ⍝ Right rank of g is ⍴⍴y
     nast[glarg,grarg;asttype]←ast[larg,rarg;asttype] ⍝ Types of g are x,y
     nast[op[;0];astrank]←E 0                 ⍝ Fake type/rank for f
     nast[op[;0];asttype]←ER0 ast[larg;asttype]
  ⍝ Now propagate g info up into ∘.g
     nast[i/⍳⍴i;asttype]←ast[op[;1];asttype]
     lrank←ast[larg;astrank]
     grank←ast[op[;1];astrank]
     j←(~lrank∊NULL)∧~grank∊NULL
     :If 1∊j ⍝ Stupid APL2 empty array nonsense
         nast[(i\j)/⍳⍴i;astrank]←ER0(j/lrank)+j/grank
     :EndIf
     'interesting predicates?'assert∧/nast[op;astPred]≡¨E astPredLen⍴0
     i←~(ER1 ast)≡¨ER1 nast
     j←astmerge(E ast),(E i⌿nast),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
     wl[i[op[;0]]]←0 ⍝ Don't look at ∘ again
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
