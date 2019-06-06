 r←dfaPHI y;ast;wl;i;j;k;m;n;phil;phir;pl;pr;p;cols
 ⍝ Handle SSA PHI Functions
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E':PHI'
 wl←wl∧~i ⍝ Update worklist
 :If 1∊i ⍝ Any work?
     m←i⌿ast ⍝ Two copies of :PHI
     k←m
 ⍝
     phil←D k[;astlarg] ⍝ Get both phi arguments
     phir←D k[;astrarg]
 ⍝
 ⍝ We MUST do partial merges here, even though
 ⍝ we may have to undo work later. For example,
 ⍝ in GAPC, DOA←⍳0, then within loop, we do DOA←DOA,DF
 ⍝ We can't determine DOA within loop if we don't have
 ⍝ a starting point.
 ⍝
 ⍝ However, if astvalues are both claimed to be known, but
 ⍝ are different, we don't update that part of the ast.
     j←ast[phil;astvalue]≡¨ast[phir;astvalue]
     pl←D ast[phil;astPred]
     pr←D ast[phir;astPred]
     j←j∧pl[;astPredKnowValue]≡¨pr[;astPredKnowValue]
 ⍝
     cols←(astchar≠astShapeClique)/astchar
     k[;cols]←ast[phil;cols] ⍝ Merge ⍺
 ⍝ Above line will pick up current astPred
     k[j/⍳⍴j;astvalue]←m[j/⍳⍴j;astvalue]
     k←astmerge(E ast),(E k),E i
     ast←D k[0] ⋄ wl←wl∨D k[1]
     k←i⌿ast ⍝ New "old" rows
     p←k[;astPred]
     k[;astchar]←ast[phir;astchar] ⍝ Merge ⍵
     k[;astPred]←p∧k[;astPred] ⍝ Update astPred
 ⍝ Try to prevent screwup if astPredKnowValue and different values
     k[j/⍳⍴j;astvalue]←m[j/⍳⍴j;astvalue]
     ast[j/i/⍳⍴i;astPred,astPredValues]←j⌿k[;astPred,astPredValues]
     m←astmerge(E ast),(E k),E i
     ast←D m[0] ⋄ wl←wl∨D m[1]
 ⍝
 ⍝ Now set PHI target characteristics
     m←D(i⌿ast)[;asttarget] ⍝ targets
     k←ast[m;]
     k[;cols]←(i⌿ast)[;cols]
 ⍝ Force type and rank to maximum of phil and phir.
     j←k[;,asttype]
     j←j maxtype ast[phil;,asttype]maxtype ast[phir;asttype]
     k[;,asttype]←j
     k[;,astrank]←k[;,astrank]⌈¨ast[phil;,astrank]⌈¨ast[phir;,astrank]
     k←k[⍋m;] ⍝ Make ordering same for old and new
     m←astmerge(E ast),(E k),E(⍳⍴i)∊m
     ast←D m[0] ⋄ wl←wl∨D m[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
