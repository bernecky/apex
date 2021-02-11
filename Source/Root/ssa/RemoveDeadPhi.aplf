 r←RemoveDeadPhi y;ast;b;i
⍝ Remove a PHI if its result is never used.
⍝ This typically arises when a variable is
⍝ set within a loop. The PHI at the loop
⍝meets the value error coming from the
⍝ ENTRY node and the loop closure, but
⍝ the PHI is not needed.
⍝
⍝ Not sure if I have PlacePhiFunctions wrong or not...
⍝ 1995-09-23
 ast←D y[ssaast]
 b←ast[;astfn]∊E':PHI' ⍝ Find all :PHIs
 i←b\~(b⌿ast[;asttarget])∊ast[;astptrs] ⍝ Mark dead wood
 i←i/⍳1↑⍴ast
 ast[i;]←astNewRows⍴i ⍝ Kill dead ones
 r←y ⋄ r[ssaast]←E ast
