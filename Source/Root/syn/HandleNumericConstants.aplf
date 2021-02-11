 r←ast HandleNumericConstants st;cv;i;shp;p;j;cur;pd;astrow;xr
 ⍝ Build ast entries for numeric constants
 ⍝ This function fills in the type, rank, shape, and value.
 ⍝ Locate constants
 cv←(st[;stclass]∊E astclassNC)/⍳1↑⍴st
 ast[cv;asttarget]←st[cv;stname] ⍝ Name of constant
 ast[cv;astvalue]←st[cv;stname] ⍝ and its value, sort of(no rank)
 ast[cv;asttype]←ConstantType st[cv;stname] ⍝ Type
 i←quadfi¨st[cv;stname] ⍝ Value
 shp←xr←⍴¨i ⍝ Element count
 shp[(,1=D shp)/⍳⍴shp]←E⍳0 ⍝ Scalars vs vectors
 ast[cv;astshape]←shp
 ast[cv;astrank]←(E'')⍴¨⍴¨shp ⍝ Rank (always 0 or 1)
 ast[cv;astxrho]←(E'')⍴¨xr ⍝ Element count
 p←((⍴cv),astPredLen)⍴0 ⍝ Establish predicates
 :For j :In ⍳⍴cv
     cur←D i[j] ⍝ NB. We lose rank info here
     p[j;astPredAll2]←∧/cur equalzf 2
     p[j;astPredSortedUp]←1=⍴cur ⍝ Bad, but a starting point...
     p[j;astPredSortedDown]←1=⍴cur
     p[j;astPredNoDups]←(⍴cur)≡⍴nubzf cur ⍝ No dups?
     p[j;astPredPV]←∧/cur epsilonzf⍳⍴cur ⍝ ∧/⍵∊⍳⍴⍵
     p[j;astPredNonNeg]←∧/0≤cur
     p[j;astPredInteger]←∧/cur equalzf floorzf cur
 ⍝ Add predicate info requiring analysis of value.
     astrow←ast[cv[j];] ⍝ The ast row of interest
     pd←D astrow[astPredValues] ⍝ The predicate-related data
 ⍝ pd has same format as the predicate list.
 ⍝⍝⍝⍝ WRONG WRONG WRONGpd[astPredKnowValue]←i[j] ⍝ The actual value (again)
 ⍝⍝⍝Next 2 lines are also wrong, but we don't use that stuff today 2000-04-09
     pd[astPredKnowMaxVal]←⌈/,cur
     pd[astPredKnowMinVal]←⌊/,cur
     astrow[astPredValues]←E pd ⍝ values associated w/predicates
     ast[cv[j];]←astrow ⍝ Back into the ast with them.
 :EndFor
 p[;astPredPVSubset]←p[;astPredPV] ⍝ Cheapness redux
 p[;astPredKnowValue,astPredKnowMaxVal,astPredKnowMinVal]←1
 ast[cv;astPred]←ER1 p
 r←ast
