 r←dfaAssign y;i;j;k;m;ast;wl;b;c;src;assigns
 ⍝ Handle straight assignment, and ⎕←
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧isnum ast[;asttarget] ⍝ Numeric targets
 i←i∧~ast[;asttarget]∊NULL
 ⍝ Assign, dex, and the implicit/explicit result assigns
 assigns←(E astfnCopy),(E,'←'),(E,'€'),(E':RE'),(E':RI'),(E'⎕←')
 i←i∧ast[;astfn]∊assigns
 wl←wl∧~i ⍝ Update worklist
 :If 1∊i ⍝ Any work?
 ⍝ Copy array or lfn chars from source to target.
     k←D(i⌿ast)[;asttarget]
 ⍝ Kill temp assigns, leaving assigns to identifiers only
     src←D(i⌿ast)[;astrarg]
     j←ast[src;]             ⍝ Right argument of assign
     m←i⌿ast                 ⍝ Result of assign
⍝ Force rank and type of system variable assigns 2004-08-02 rbe
     c←m[;astclass]∊astclassVARB ⍝ Don't change varb class to const
     c←c∧j[;astclass]∊astclassNC,astclassCC
     j[c/⍳⍴c;astclass]←m[c/⍳⍴c;astclass]
     m[;astchar,astclass]←j[;astchar,astclass]
     ast←ast JoinShapeClique(i/⍳⍴i),⍪src
     m←astmerge(E ast),(E m),E i
     ast←D m[0] ⋄ wl←wl∨D m[1]
 ⍝ Varbs change astchar only
 ⍝ 1995-11-14 Problems. Try everyone changes astchar only
 ⍝ Later on 1995-11-14. This causes f←+ to stop
 ⍝ working, because it thinks the rarg to ← is varb. shit.
     m←ast[;astclass]∊astclassVARB
     b←(~(⍳¯1↑⍴ast)∊astchar)/⍳¯1↑⍴ast
     c←i/m
     j[c/⍳⍴c;b]←ast[c/k;b] ⍝ Restore some fields
     ast←ast JoinShapeClique(i/⍳⍴i),⍪k
     j←j[⍋k;] ⋄ k←(⍳1↑⍴ast)∊k ⍝ Sort into cv order
     j←j TypePromote k⌿ast
     j←astmerge(E ast),(E j),E k
     r←y
     r[ssaast]←j[0]
     r[ssacv]←E wl∨D j[1]
     r←ExpandLFNs r
     ast←D r[ssaast]
     wl←D r[ssacv]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
