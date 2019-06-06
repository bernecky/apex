 r←dfaDex y;ast;wl;i;j;k
 r←y ⋄ →0 ⍝ ????
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝DEAD CODE BELOW
 ⍝ dfa for dex primitive
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E,'€' ⍝ Dex
 wl←wl∧~i ⍝ Mark our work done
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 →(0=∨/i)⍴lz ⍝ No work
 ⍝ Result is right argument.
 k←ast[j←D i⌿ast[;astrarg];astchar]
 j←ast[i/⍳⍴i;]
 j[;asttype,astrank,astshape]←k
 j←astmerge(E ast),(E j),E i
 ast←D j[0] ⋄ wl←wl∨D j[1]
lz:r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
