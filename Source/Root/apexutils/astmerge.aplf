 z←astmerge y;i;chg;r;oldrows;ast;newrows;x;j;wl;cv;k;b;pv;force;po;pn;p;dbg;forced
 ⍝ Merge new characteristics into ast.
 ⍝ y is ast;newrows;cv
 ast←D y[0]
 newrows←D y[1]
 cv←D y[2]
 forced←⍳0
 cols←astchar
 Checkem(E'?'),E ast
 oldrows←cv⌿ast
 b←(UnSSAName¨oldrows[;asttarget])≡UnSSAName¨newrows[;asttarget]
 'newrows in wrong order'assert b
 ⍝ 2006-08-13 Can't force astPred, astPredValues, unless
 ⍝ we also force astvalue, but it won't work, because
 ⍝ we may know a value, then lose it. E.g., QUADrl in UTQuery
 b←newrows[;astrank]∊E 0 ⍝ Scalars have known shape, xrho
 newrows[b/⍳⍴b;astshape]←E⍳0
 newrows[b/⍳⍴b;astxrho]←E 1
 k←newrows[;astshape]
 b←~k∊NULL ⍝ Known shapes
 'astshape not vector'assert(~b)∨,1=D⍴¨⍴¨k
 :If 1∊b ⍝ Avoid nonce error in next line
     newrows[b/⍳⍴b;astxrho]←×/¨b/k⍝ Set xrho from shape, if known
 :EndIf
 ⍝ 2015-08-20 I am guessing that the next few lines that tinker
 ⍝ chg implement the 2006-08-13 restriction noted above, which I
 ⍝ do not understand, despite having written the above.
 ⍝ The intent of my change now is to let astPred, astValue, etc.
 ⍝ to be merged if the old value is NULL.
 ⍝ This is to allow UTTakeDrop to pass arguments from main into Take and Drop.
 chg←(~oldrows ≡⍤0⊢ newrows)∧~newrows∊NULL
 ⍝⍝k←(astNewRows 1)[;astPred,astPredValues]
 ⍝⍝chg[;astPred]←~newrows[;astPred]∊k[;0]
 ⍝⍝chg[;astPredValues]←~newrows[;astPredValues]∊k[;1]
 wl←(1↑⍴ast)⍴0 ⍝ Assume no work
 :If (1∊chg) ⍝ Any work?
     r←(⍴oldrows)⍴1 ⍝ New dfa does overwrite
     i←(⍴r)⍴0 ⋄ i[;cols]←1
     k←i∧(~r)∧chg ⍝ Change non-null characteristic?
     j←1↑1↓stophere ⍝ DEBUG
     'Debug halt'assert~((1↑stophere)∊ast[0;asttarget])∧1∊(cv/⍳⍴cv)∊D 1↓stophere
     :If (1∊k)
         'Attempt to change ast characteristic'
         j←(((∨/k)⌿oldrows),E'old')⍪((∨/k)⌿newrows),E'new'
         j←j⍪' ∧'[∨⌿k],' '
         seeast j
         ÷0
     :EndIf
     r←r∧i∧chg ⍝ Characteristics only, please
     j←(r⊖oldrows,[¯0.5]newrows)[0;;]
     'y'assert ast≡D y[0]
     wl←cv\~∧/D j≡¨cv⌿ast     ⍝ Mark changing ast rows
     ast[cv/⍳⍴cv;]←j          ⍝ Actually update ast
     wl←(wl/ast[;asttarget]),ER0 wl/⍳⍴wl ⍝ Affected targets
     wl←∨/ast[;astptrs]∊wl    ⍝ temps or named targets
     wl←wl∧dfainit ast ⍝ Don't work on s.t.
     ast←cv PropArgs ast ⍝ Propagate new info for +.×, etc.
    ⍝⍝⍝⍝ ast[;astPred]←Predicates¨ER1 ast
     Checkem(E'?'),E ast
 :EndIf
 z←(E ast),E wl
 dbg←1∊(cv/⍳⍴cv)∊D 1↓stophere
 j←1↑1↓stophere
 'Debug halt'assert~((1↑stophere)∊ast[0;asttarget])∧dbg
