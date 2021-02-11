 r←cv FORRenameOne ast;phimark;phi;phiz;k;astr;newnm;phit;cv2;m;bf
 ⍝ Rename variables for X vs OLD X in a single
 ⍝ :For loop. Work within the scope of the loop only.
 ⍝ Rename the :PHI variable so that it refers to
 ⍝ cv marks the :For loop bounds
 ⍝
 ⍝ 1996-04-08 This could do less work by only looking
 ⍝ at ast rows marked by cv.
 ⍝
 ⍝ 1996-04-10 Do NOT mark loop control variable as "old".
 ⍝ Loop body code always sees "new" value.
⍝ 2002-02-22 rbe. Change all refs to :For result to
⍝ point to the right argument of the :For :PHI. This for SAC
⍝ only.
 ⍝
 bf←cv∧ast[;astfn]∊E':For'
 phimark←cv∧ast[;astfn]∊E':PHI'
 ⍝ Don't rename loop ctl vars
 k←~(phimark⌿ast)[;asttarget]∊(bf⌿ast)[;asttarget]
 phimark←phimark\k
 phi←(¯1⌽cv)pandscan phimark
 phiz←phi/⍳⍴phi ⍝ Refs to these get renamed
 :If ×⍴phiz     ⍝ Stupid APL2 prototypes
  ⍝
  ⍝ Gen "OLD z" names
     k←D ast[phiz;astrarg] ⍝ Symbol table entries
     k←ast FindReferent k
     phit←ast[phiz;asttarget] ⍝ Identifiers to rename
     newnm←(E OLD),¨ast TargetName k
     newnm←ER0 ast[;asttarget]⍳newnm
     'rbe is confused'assert∧/newnm<ER0 1↑⍴ast
  ⍝ Rename target refs to point to "z" names within
  ⍝ scope of :For loop
     k←ast[;astptrs]
     m←⍴k
     phit←ast[phiz;asttarget] ⍝ Things to rename
     cv2←k∊phit ⍝ The renames to be done
  ⍝ Do not renumber :PHI ⍵
     cv2[phimark/⍳⍴phimark;astptrs⍳astrarg]←0
  ⍝ Do not renumber outside scope of :For loop
     cv2[(~cv)/⍳⍴cv;]←0
     cv2←,cv2
     k←,k ⋄ k[cv2/⍳⍴cv2]←ER0 newnm[phit⍳cv2/k]
     ast[;astptrs]←m⍴k
 :EndIf
 r←ast
