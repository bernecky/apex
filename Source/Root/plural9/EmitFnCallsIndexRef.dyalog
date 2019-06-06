 r←EmitFnCallsIndexRef y;tar;ast;cv;fns;i;mil;cal;I;X;sis;k;p
 ast←D y[0]
 cv←D y[1]
 fns←D y[2]
 cal←D y[3]
 i←ast[;astfn]∊E,'[' ⍝ Locate index references
 :If (1∊i) ⍝ Got work?
     cv←cv∧~i ⍝ Update worklist
     mil←(E ast)IndexList¨(i/⍳⍴i),¨astrarg ⍝ Build all index lists
 ⍝                              as matrix of indices, NULLS, and 0s
     cal←cal EmitFnCallsIndexABC(E ast),(E mil),E i
     :If ~0∊⍴mil ⍝ Anything that can't be done w/single SAC expression?
         I←ast TargetName ast FindReferent D mil                 ⍝ I
         X←ast TargetName ast FindReferent i⌿ast[;astlarg] ⍝ X
         sis←'indr'EmitFnCallsIndexIBC(E X),(E I),(E mil),E i
         p←EmitFnCallsIndexDirect(E i),(E mil),E ast
         k←D p[0]
         cal[(i\k)/⍳⍴i;calfn]←D p[1]
         cal[(i\~k)/⍳⍴i;calfn]←Raze⍉(~k)⌿sis
         cal[i/⍳⍴i;caltypes,calranks,callpar]←E''
         cal[i/⍳⍴i;callarg,calcomma,calrarg,calrpar]←E''
     :EndIf
 :EndIf
 r←(E ast),(E cv),(E fns),E cal
