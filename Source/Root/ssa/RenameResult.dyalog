 r←RenameResult y;ast;i
⍝ In Tagast, we appended z←z to the
⍝ ast (where z is the explicit result of the
⍝ function). Now, that has been renamed,
⍝ so we rename it back to E 1 (canonical row index
⍝ of explicit result in ast).
 ast←D y[ssaast]
 i←¯1+1↑⍴ast
 r←y
 :If ~ast[dfnres;asttarget]≡E,'-' ⍝ If there is an explicit result
     'SSA screwup'assert ast[i;astfn]∊E,':RE'
     ast[i;asttarget]←E dfnres ⍝ Now points to real explicit result
     r[ssaast]←E ast
 :EndIf
