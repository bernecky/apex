﻿ r←ast IndexRank i;p;j;cv
 ⍝ Attempt to determine result rank of index
 ⍝ expression at row i of ast
 p←D ast IndexList i
 :If p∧.=¯1  ⍝ X[;;;;;] case
     r←⍴p
 :Else
     r←NULL
  ⍝ Now have list of ast rows (& NULLs)
  ⍝ used to perform the index. If we know all
  ⍝ ranks, we can produce result rank
     j←ast[(cv←p≥0)/p;astrank] ⍝ Get all ranks
     :If ~NULL∊j
  ⍝ We know ranks of all named indices
         r←E(+/D j)++/~cv ⍝ Add in the elided indices
     :EndIf
 :EndIf
