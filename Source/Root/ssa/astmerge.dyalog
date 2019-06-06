 z←cols astmerge y;i;chg;r;oldrows;ast;newrows;x;j;wl;cv;k;b;pv;force;forced;po;pn;p
 ⍝ Merge new characteristics into ast.
 ⍝ y is ast;newrows,cv
 :If (0=⎕NC'cols') ⍝ If cols not specified, use astchar
     cols←astchar
 :EndIf
 y←cols SideEffects y
 ast←D y[0] ⋄ newrows←D y[1] ⋄ cv←D y[2]
 oldrows←cv⌿ast
 ⍝
 ⍝ Rank and type become higher of ranks and types
 forced←asttype,astrank,astPred,astPredValues
 b←oldrows[;asttype,astrank]⌈newrows[;asttype,astrank]
 b←b,newrows[;astPred,astPredValues]
 newrows[;forced]←b
 force←oldrows[;forced] ⍝ These elements forced
 force←(~force∊NULL)∧~force∊b ⍝ to change
 ⍝
 b←newrows[;astrank]∊E 0 ⍝ Scalars have known shape, xrho
 newrows[b/⍳⍴b;astshape]←E⍳0
 newrows[b/⍳⍴b;astxrho]←E 1
 k←newrows[;astshape]
 b←~k∊NULL ⍝ Known shapes
 'astshape not vector'assert(~b)∨,1=D⍴¨⍴¨k
 :If 1∊b ⍝ Avoid nonce error in next line
     newrows[b/⍳⍴b;astxrho]←×/¨b/k⍝ Set xrho from shape, if known
 :EndIf
 chg←(~oldrows matchR0 newrows)∧~newrows∊NULL
 wl←(1↑⍴ast)⍴0 ⍝ Assume no work
 :If (1∊chg) ⍝ Any work?
     r←(⍴oldrows)⍴1 ⍝ New dfa does overwrite
     r[;forced]←r[;forced]∨force
     r[;astPred]←1 ⍝ Stupid pervasive arrays fixup
     i←(⍴r)⍴0 ⋄ i[;cols]←1
     k←i∧(~r)∧chg ⍝ Change non-null characteristic?
 ⍝ Don't warn forced type, rank changes.
     k[;forced]←k[;forced]∧~force
 ⍝ Value may validly become
 ⍝ unknown (dfaPHI join point) 1996-03-11
 ⍝ BUT this should be handled by dfaPHI
     j←1↑1↓stophere ⍝ DEBUG
     'Debug halt'assert~((1↑stophere)∊ast[0;asttarget])∧cv[j×j<⍴cv]
     :If (1∊k)
         'Attempt to change ast characteristic'
         j←(((∨/k)⌿oldrows),E'old')⍪((∨/k)⌿newrows),E'new'
         j←j⍪' ∧'[∨⌿k],' '
         seeast j
 ⍝ ∘
     :EndIf
     r←r∧i∧chg ⍝ Characteristics only, please
     j←(r⊖oldrows,[¯0.5]newrows)[0;;]
     ast←D y[0]
     ast[cv/⍳⍴cv;]←j
     wl←cv\∨/r ⍝ Get new worklist items
     wl←(wl/ast[;asttarget]),ER0 wl/⍳⍴wl ⍝ Affected targets
     wl←∨/ast[;astptrs]∊wl ⍝ temps or named
     wl←wl∧dfainit ast ⍝ Don't work on s.t.
     ast←cv PropArgs ast ⍝ Propagate new info
 ⍝ Propargs needed by code generator for
 ⍝ things like f←+.×, where we don't have
 ⍝ arguments around any more. Knowing ranks and
 ⍝ types lets us generate code.
 :EndIf
 z←(E ast),E wl
 j←1↑1↓stophere
 'Debug halt'assert~((1↑stophere)∊ast[0;asttarget])∧cv[j×j<⍴cv]
