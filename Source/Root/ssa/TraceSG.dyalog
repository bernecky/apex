 msg TraceSG cds;ast;me;mysg;j;i
 :If trace           ⍝ DEBUG only
     :For i :In ⍳⍴cds
         ast←D(D cds[i])[ssaast]
         me←D ast[dfnname;asttarget]
         mysg←(~dfainit ast)∧~ast[;astscope]∊astscopeL
         j←mysg⌿ast[;,asttarget]
         mysg←j,((E'in'),(E'out'),E'in/out')[¯1+D mysg⌿ast[;,astscope]]
         ⎕←msg,': semiglobals for: ',me,' are:'
         ⎕←⍕mysg
     :EndFor
 :EndIf
