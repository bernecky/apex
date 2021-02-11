 r←FORRename y;ast;bf;phi;phiz;k;newnm;astr;m;cv;phimark;phit;ef;nd;mns;OLD
 ⍝ Rename variables for X vs OLD X in :For loops
 ⍝ Rename the :PHI variables so that they refer to
 ⍝ the loop-carried name rather than the SSA name
 ⍝ Observation: references to z in z←⍺ :PHI ⍵ are
 ⍝ changed to be "old ⍵".
 ⍝ Ah, except on the PHI itself.
 ⍝
 ⍝ The above observation may be an easier way to
 ⍝ generate this than the mess originally below.
 ⍝ 1996-04-05
 ⍝
 ⍝ 1996-04-08 Still trying to make this work.
 ⍝ The items we change are as follows:
 ⍝ assume :PHI z points to name X at row asti.
 ⍝ We change astptrs∊asti only.
 ⍝ In particular, the NAME of :PHI z is not relevant
 ⍝ to the rename.
 ⍝ 1996-04-08. The above fails, because a ref to
 ⍝ :PHI z OUTSIDE the :For loop (e.g., a result of
 ⍝ the :For) must NOT be renamed. Hence, we will,
 ⍝ for the nonce, do these one at a time from inner
 ⍝ to outer loops, restricting renames to the scope of
 ⍝ the loop.
⍝ 2004-02-22 rbe. We try to ignore this stuff as much
⍝ as possible for SAC, but still preserve the good
⍝ things about SSA, so that initial value and loop-carried
⍝ values of variables need not be same type, e.g.:
⍝  i←0 as initial value (Boolean), and i←i+1 for lcv (integer).
 ⍝
 ast←D y[ssaast]
 ⍝ Introduce "old z" names for all :PHIs associated
 ⍝ with :For
 bf←ast[;astfn]∊E':for' ⍝ Begin :For loop
 :If 1∊bf ⍝ Any work?
 ⍝ Mark :PHIs associated with each :For loop
     phimark←ast[;astfn]∊E':PHI'
 ⍝ DO NOT rename the loop control variable.
 ⍝ k marks :PHIs to be renamed
     k←~(phimark⌿ast[;asttarget])∊(bf⌿ast)[;asttarget]
     phi←(¯1⌽bf)pandscan phimark
     phimark←phimark\k
     phiz←phimark/⍳⍴phimark ⍝ Refs to these get renamed
 ⍝
 ⍝ Gen "OLD z" names
     OLD←''
     :If 0≠⍴phiz           ⍝ Stupid APL2 prototypes
         k←D ast[phiz;astrarg] ⍝ Symbol table entries
         k←ast FindReferent k
         phit←ast[phiz;asttarget] ⍝ Things to rename
         newnm←(E OLD),¨ast TargetName k
         astr←ast[k;]               ⍝ Gen new ast rows
         astr[;asttarget]←newnm
      ⍝ Expand ast
         astp←¯1+(dfainit ast)⍳1 ⍝ Index of 1st new name
         ast←ast astInsertSymbols astr
     :EndIf
      ⍝ Rename within loop scopes from inner to outer loops
     nd←ast NestingDepth(E':for'),E':endfor'
 ⍝
lp:  →(0=mnd←⌈/nd)⍴lpz ⍝ Work outwards from inner loops
     cv←nd=mnd ⋄ ⍝ Mark next loop
     cv←cv∧¯1⌽∧\~cv>(1↓cv),0 ⍝ Do 2nd loop at same level later
     ast←cv FORRenameOne ast ⍝ Do one set of renames
     ast←cv FORResultRenameOne ast ⍝ Simplify loop result
     nd←nd-cv ⍝ Reduce nesting depth for just-processed loop
     →lp
lpz:
 :EndIf
lz:r←y ⋄ r[ssaast]←E ast
