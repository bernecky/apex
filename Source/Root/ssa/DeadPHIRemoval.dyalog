 r←DeadPHIRemoval cds;ast;cv;tar;dead
⍝ Kill :PHI entries that have unreferenced targets
 ast←D cds[ssaast]
 cv←ast[;astfn]∊E':PHI'
 tar←cv⌿ast[;asttarget] ⍝ PHI Targets
 dead←~tar∊ast[;astptrs]
 cv←~cv\dead ⍝ Compression vector for ast
 ast←(¯1++\cv)RenumberAst ast ⍝ New numbers for old
 ast←cv⌿ast ⍝ Delete unreferenced :PHI entries
 r←cds
 r[ssaast]←E ast
