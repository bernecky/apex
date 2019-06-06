 r←ast FindReferent y;j;cv
⍝ y is ast index list
⍝ Find the ast row where the item obtains its value
 r←,D y
⍝ If the ast target points somewhere else, go
⍝ indirectone level.
⍝ Possible classes of y
⍝    pointer to temp
⍝    pointer to name
⍝    pointer to pointer to name
⍝    Null
⍝
 cv←~r∊NULL ⍝ Ignore NULLS
 cv←cv\~ast[cv/r;asttarget]≡¨cv/r ⍝ Mark non-temps
 cv←cv\(dfainit ast)[cv/r]⍝ Eliminate names
 r[cv/⍳⍴cv]←,D ast[cv/r;asttarget]
 r←(⍴y)⍴r
