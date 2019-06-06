 r←ast TargetName y;n;cv;nul;ref;p
 ⍝ Generate names of targets
 ⍝ y is potential ast indices and/or names
 ⍝ 4 categories:
 ⍝   y is named: leave untouched
 ⍝   y points to temp (#):
 ⍝     Replace by TempName(A_nn)
 ⍝   null: Replace by nasty word
 ⍝   y points to constant:
 ⍝     Replace by TempName
 ⍝
 r←,y
 p←dfainit ast
 n←p⍳1
 nul←r∊NULL
 ⍝ NULL referents
 r[nul/⍳⍴nul]←E'NULL!'

 ⍝ Find referents
 cv←(~nul)∧isnum r
 :If 1∊cv ⍝ Stupid APL2 prototypes
     cv←cv\isnum ast[D cv/r;asttarget]
     r[cv/⍳⍴cv]←ast[D cv/r;asttarget]
 ⍝
     cv←(~nul)∧isnum r
     ref←cv/r ⍝ Name temp referents
     cv←cv\isnum ast[ref;asttarget] ⍝ Unless already named
     ref←cv/⍳⍴r
     r[ref]←TempName cv/r
 ⍝ If target non-constant name, use it
     cv←(~nul)∧isnum r
     cv←cv\~isnum ast[,D cv/r;asttarget]
     cv←cv\~isAstConstant ast[,D cv/r;]
     ref←cv/r
     :If 0≠⍴ref ⍝ Stupid APL2 prototypes
         r[cv/⍳⍴cv]←ast[ref;asttarget]
     :EndIf
 ⍝ Deal with constants
     cv←(~nul)∧isnum r
     r[cv/⍳⍴cv]←TempName cv/r
 :EndIf
 r←(⍴y)⍴r
