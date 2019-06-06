﻿ r←ast HandleLabels y;cv;i;shp;src;tok;lbl;lin;p;pd;k
 ⍝ Build ast entries for line labels.
 ⍝ This function fills in the type, rank, shape, and value.
 src←D y[0] ⋄ tok←D y[1]
 cv←(ast[;astclass]∊clscolon)/⍳1↑⍴ast ⍝ Mark line labels.
 lbl←src getlbls tok ⍝ Find line #s for labels
 j←ast[;asttarget]⍳D lbl[1]
 ast[j;astvalue]←D lbl[0] ⍝ Value of labels
 ast[cv;astshape]←E⍳0
 ast[cv;astrank]←E 0 ⍝ Rank 0
 ast[cv;astxrho]←E 1 ⍝ Labels are 1 element
 ast[cv;asttype]←E asttypeI ⍝ Labels are integer
 p←astPredLen⍴0 ⍝ Establish predicates
 p[astPredNoDups,astPredSortedUp]←1
 p[astPredKnowValue,astPredKnowMaxVal,astPredKnowMinVal]←1
 p[astPredSortedDown,astPredNonNeg,astPredInteger]←1
 ast[cv;astPred]←E p
 :For i :In cv/⍳⍴cv ⍝ Establish predicate associated data
     pd←D ast[i;astPredValues]
     k←ast[i;astvalue]
     pd[astPredKnowMaxVal,astPredKnowMinVal]←k
     pd[astPredKnowValue]←1
     ast[i;astPredValues]←E pd
 :EndFor
 r←ast
