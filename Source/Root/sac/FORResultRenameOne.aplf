 r←cv FORResultRenameOne ast;phimark;phi;phiz;k;astr;newnm;phit;cv2;m;k2
 ⍝ Rename :For loop result references for SAC only.
 ⍝ This could probably be done easier by avoiding
 ⍝ the renaming in the SSA phase, but languages
 ⍝ like SISAL still need it, so we undo the work here.
 bf←cv∧ast[;astfn]∊E':for'
 phimark←cv∧ast[;astfn]∊E':PHI'
 ⍝ Find the phi result(s) -- there may be several!
 k←~(phimark⌿ast)[;asttarget]∊(bf⌿ast)[;asttarget]
 phimark←phimark\k
 phi←(¯1⌽cv)pandscan phimark
 phiz←phi/⍳⍴phi ⍝ Refs to these :PHI results
 :If ×⍴phiz     ⍝ Stupid APL2 prototypes
  ⍝
     newnm←D ast[phiz;astrarg] ⍝ change into these names
     newnm←ast FindReferent D ast[phiz;astrarg]
     phit←ast[phiz;asttarget] ⍝ Targets to rename
     k2←,phit⍳ast[;astptrs]
     cv←k2<ER0⍴phit  ⍝ Ignore other names
     k←ast[;astptrs]
     m←⍴k
     k←,k
     k[cv/⍳⍴cv]←ER0 newnm[cv/k2]
     ast[;astptrs]←m⍴k
 :EndIf
 r←ast
