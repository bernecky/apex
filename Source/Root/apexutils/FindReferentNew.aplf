 r←ast FindReferentNew y;j;cv
⍝ y is ast index list
⍝ Find the ast row where the item obtains its value
 r←,D y
⍝ FindReferent doesn't seem to work properly.
⍝ This one tries to be simpler.
⍝ If the ast target points somewhere else, go
⍝ indirect one level.
⍝ 3 possible classes of y
⍝    pointer to temp
⍝    pointer to name
⍝    pointer to pointer to name
⍝
 cv←~ast[r;asttarget]≡¨r ⍝ Mark non-temps
 cv←cv\(dfainit ast)[cv/r]⍝ Eliminate names
 r[cv/⍳⍴cv]←,D ast[cv/r;asttarget]
