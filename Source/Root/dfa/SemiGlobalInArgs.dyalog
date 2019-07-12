 r←cds SemiGlobalInArgs astrow;nast;tar;astr;j;wl
⍝ Propagate Semiglobal dfa info from ast row of caller
⍝ to the callee
 nast←D cds[ssaast] ⍝ Callee's ast
 Checkem(E'?'),E nast
 wl←D cds[ssacv] ⍝ Worklist
 tar←UnSSAName¨astrow[;asttarget] ⍝ Get original name again
 tar←D(UnSSAName¨nast[;asttarget])⍳tar ⍝ Find the targets
 astr←nast[tar;]                   ⍝ Affected rows in subfn
 astr[;astchar]←astrow[;astchar]   ⍝ Update subfn's ast
 j←astmerge(E nast),(E astr),E(⍳1↑⍴nast)∊tar
 :If trace≠0 ⍝ DEBUG
     :If ~0∊⍴astrow
         ⎕←'Semiglobals into: ',D sast[0;asttarget]
         ⎕←'before: ' ⋄ nast[tar;asttarget]
         ⎕←'after : ' ⋄ astr[;asttarget]
     :EndIf
 :EndIf
 Checkem(E'?'),j[0]
 nast←D j[0]
 wl←wl∨D j[1]
 r←cds ⋄ r[ssaast]←E nast ⋄ r[ssacv]←E wl
