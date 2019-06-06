 r←buildgst y;i;j;gen;nogen
 ⍝ Get class and valence, etc., of function
 ⍝ Result is 3-element vector of:
 ⍝ fn names⊃class⊃scope (global)
 src←D y[0]
 j←src[,0;],' '
 i←j≠'←'
 nogen←astclassnFN,astclassmFN,astclassdFN ⍝ These fns do not gen results
 gen←astclassNFN,astclassMFN,astclassDFN ⍝ These fns generate results
 r←,D((E nogen),E gen)[∨/~i] ⍝ Returns result?
 i←,i∧(⌽∧\⌽i)∧∧\j≠';' ⍝Get valence.
 i←' '=j←(⍴j)⍴i\i/,j ⍝ Just arguments.
 i←¯1++/i>1⌽i ⍝ Valence.
 r←r[''⍴i]
 j←rtnb(i=2)crtb rtnb j ⍝ Isolate fn names.
 j←,getfield j
 r←(E j),(E r),E 0 ⍝??? why always zero?
