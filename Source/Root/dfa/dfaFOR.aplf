 r←dfaFOR y;ast;wl;i;j;k;b;n;p;rh
 ⍝ Handle Dyalog :for loop
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←ast[;astfn]∊E':for'
 wl←wl∧~ast[;astfn]∊E':endfor' ⍝ Ignore ends
 wl←wl∧~i ⍝ Update worklist
 :If 1∊i ⍝ Any work?
     j←D(i⌿ast)[;astrarg]
     k←i⌿ast
     rh←ast[j;]
  ⍝ Type of N in :for N :in Y is type of Y
     k[;asttype]←rh[;asttype]
  ⍝ Rank of N in :for N :in Y is 0⌈(rank of Y)-1
     k[;astrank]←0⌈¯1+rh[;astrank]
     j←astmerge(E ast),(E k),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
  ⍝ Now merge the updated ast info into the
  ⍝ targets N of the :for expressions
     i←D k[;asttarget] ⋄ n←ast[i;] ⍝ N and S.T. entries
     n[;astchar]←k[;astchar]
     p←astPredLen⍴0 ⍝ Maintain predicates
     p[astPredAll2,astPredSortedUp,astPredSortedDown]←1
     p[astPredPVSubset,astPredNoDups,astPredNonNeg]←1
     p[astPredInteger]←1
     b←D rh[;astPred]
  ⍝⍝⍝⍝⍝⍝ FIXME n[;astPredPVSubset]←n[;astPredPVSubset]∨n[;astPredPV]
     n[;astPred]←ER1 b∧(⍴b)⍴p
     b←(⍳⍴wl)∊i              ⍝ Mark rows
     n←n[⍋i;]                ⍝ Sort new rows into ast order
     j←astmerge(E ast),(E n),E b
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
