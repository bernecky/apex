 r←EmitFnCallsIndexSet y;ast;cv;fns;cal;i;mil;qio;j;k;m;sis;I;X;fnm;refs;b;fn
 ast←D y[0]
 cv←D y[1]
 fns←D y[2]
 cal←D y[3]
 i←ast[;astfn]∊E,']' ⍝ Locate index sets
 :If (1∊i) ⍝ Got work?
     cv←cv∧~i ⍝ Update worklist
     qio←ast TargetName ast[(i⌿ast)[;astparms];astrarg]
     mil←(E ast)IndexList¨(i/⍳⍴i),¨astrarg ⍝ Build all index lists
 ⍝ as matrix of indices, NULLS, and 0s
 ⍝⍝⍝refs←D (E ast)IndexAstLarg¨mil
     :If 0        ⍝ zero
         cal←cal EmitFnCallsIndexABC(E ast),(E mil),E i
         k←qio EmitFnCallsIndexDirectSet(E i),(E mil),E ast
         j←D k[0]
         sis←D k[1]
         cal[j/⍳⍴j;callarg]←sis
         cal[j/⍳⍴j;caltypes,calfn,calranks,callpar]←E''
         cal[j/⍳⍴j;calcomma,calrarg,calrpar]←E''
         k←i/~j ⍝ The harder index set ops
         i←i\k
         mil←k⌿mil       ⍝ New mil defn needed FIXME
     :EndIf ⍝ zero
     :If ~0∊⍴mil ⍝ Any work?
         cal←cal EmitFnCallsIndexABC(E ast),(E mil),E i
  ⍝⍝⍝I←D (E ast) IndexAstLarg¨mil
         I←ast TargetName ast FindReferent D mil ⍝ Index lists
         X←ast TargetName ast FindReferent i⌿ast[;astlarg] ⍝ X
         Y←ast TargetName ast FindReferent i⌿ast[;astrop]  ⍝ Y
  ⍝ 2006-07-19 was 'inds' in next line.
         b←,(D(E ast)IndexAstLarg¨mil)>0 ⍝ Mark legit indices
         sis←,(ast TargetName I),¨E','
         sis[(~b)/⍳⍴b]←E''
         sis←X,(E','),((⍴I)⍴sis),Y
         sis←Raze⍉sis
         cal[i/⍳⍴i;callarg]←sis
         cal[i/⍳⍴i;caltypes]←E''
         cal[i/⍳⍴i;calfn]←cal[i/⍳⍴i;calfn],¨3↓¨cal[i/⍳⍴i;calranks]
         cal[i/⍳⍴i;calcomma,calrarg,calranks]←E''
         cal[i/⍳⍴i;calrpar]←E')'
     :EndIf
 :EndIf
 r←(E ast),(E cv),(E fns),E cal
