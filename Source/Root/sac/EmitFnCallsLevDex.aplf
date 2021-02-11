 r←EmitFnCallsLevDex y;ast;fns;cal;cv;i
⍝ Emit calls for lex and dex
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 cv←ast[;astfn]∊(E,'€'),E,'⊣' ⍝ Find lex and dex
 :If 1∊cv ⍝ Any work?
 ⍝ Generate mere assignment
     cal[cv/⍳⍴cv;caltypes]←E''
     i←(cv/ast[;astfn])∊E,'€' ⍝ Dex
     cal[(cv\i)/⍳⍴cv;callarg]←E''
     i←~i                     ⍝ Lev
     cal[(cv\i)/⍳⍴cv;calrank]←E''
 :EndIf
 r←y ⋄ r[3]←E cal
