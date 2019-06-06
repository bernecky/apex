 r←ast ParmList i;p
 ⍝ Get list of indices for SemiGlobals starting at ast row i
 r←⍳0
 p←i
 :While p≠NULL
     r←r,D ast[p;astrarg]  ⍝ This list item
     p←D ast[p;astparms]   ⍝ Next list item
 :EndWhile
