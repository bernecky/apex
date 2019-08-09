 r←ast TargetName y;cv;nul;ref;p
 ⍝ Generate names of targets
 ⍝ y is potential ast indices and/or names
 ⍝ 4 categories:
 ⍝   y is null: Replace by nasty word

 ⍝   y is named: leave as is
 ⍝   y points to temp (#): Replace by TempName(A_nn)
 ⍝   y points to constant: Replace by TempName
 ⍝
 r←,y
 p←dfainit ast
 nul←r∊NULL
 ⍝ Deal with NULL referents
 r[nul/⍳⍴nul]←E'NULL!'

 ⍝ Name each constant, unless already named
 cv←(~nul)∧isnum r
 cv←cv∧isTempName r
 r[cv/⍳⍴cv]←TempName cv/r

 r←(⍴y)⍴r
