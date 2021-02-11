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
 :If ~0∊⍴astrow
     Trace'Semiglobals into: ',D nast[0;asttarget]
     Trace'before: '
     Trace nast[tar;asttarget]
     Trace'after : ' 
     Trace astr[;asttarget]
 :EndIf
 Checkem(E'?'),j[0]
 nast←D j[0]
 wl←wl∨D j[1]
 r←cds ⋄ r[ssaast]←E nast ⋄ r[ssacv]←E wl
