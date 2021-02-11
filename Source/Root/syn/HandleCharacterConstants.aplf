 r←ast HandleCharacterConstants st;cv;i;shp;j;p;pd
 ⍝ Build ast entries for character constants
 ⍝ This function fills in the type, rank, shape, and value.
 r←ast
 ⍝ Locate quoted strings
 cv←∨/D st[;stname]∊¨''''
 cv←cv/⍳⍴cv
 :If ×⍴cv ⍝ Any work?
     ast[cv;asttarget]←st[cv;stname] ⍝ Name of constant
     ast[cv;asttype]←asttypeC ⍝ Constant type
     i←ConstantCharacterValue st[cv;stname] ⍝ Value
     shp←⍴¨i
     shp[(,1=D shp)/⍳⍴shp]←E⍳0 ⍝ Scalars vs vectors
     ast[cv;astvalue]←shp⍴¨i ⍝ Preserve proper shape in ast
 ⍝ Previous line may, in fact, cause trouble...
     ast[cv;astshape]←shp
     ast[cv;astrank]←(E'')⍴¨⍴¨shp ⍝ Rank (always 0 or 1)
     j←⍴¨,¨ast[cv;astvalue] ⍝ Element count
     ast[cv;astxrho]←(E'')⍴¨j
 ⍝
     p←astPredLen⍴0 ⍝ Establish predicates
     p[astPredKnowValue,astPredKnowMaxVal,astPredKnowMinVal]←1
     ast[cv;astPred]←E p
 ⍝
 ⍝ Fill in value, max and min values
     :For i :In cv
         pd←D ast[i;astPredValues]
         p←D ast[i;astvalue]
         pd[astPredKnowValue]←E 1
         pd[astPredKnowMaxVal]←E ⎕AV[⌈/0,⎕AV⍳,p] ⍝ 0, for ''
         pd[astPredKnowMinVal]←E ⎕AV[⌊/0,⎕AV⍳,p]
         ast[i;astPredValues]←E pd
     :EndFor
 :EndIf ⍝ Any work?
 r←ast
