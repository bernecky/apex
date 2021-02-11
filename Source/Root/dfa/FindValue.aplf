 r←ast FindValue y;d;i;j
⍝ y is an ast index.
⍝ Find the ast row where the item obtains its value
⍝ This is VERY different from FindReferentNew! 1996-04-18
 r←D y
 d←dfainit ast ⍝ Mark first row of defns
 d[dfnlarg,dfnrarg]←1 ⍝ Mark left,right arguments
 :If ~d[r] ⍝ It's a temp
 ⍝ Not temp. Look for assignment
     i←ast[;asttarget]∊y
     'ast target not SSA'assert 1=+/i
     j←i/⍳⍴i
     :If r≠j ⍝ It's a temp for sure
         r←j
  ⍝ If the assignment is an assign, go indirect
lp:      →(~ast[r;astfn]∊(E,'←'),(E,'€'),(E':RI'),E':RE')⍴0
         r←D ast[r;astrarg] ⍝ Get thing that generated
         →lp ⍝ the assign originally
     :EndIf
 :EndIf
