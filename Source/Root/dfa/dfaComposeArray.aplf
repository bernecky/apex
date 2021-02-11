 r←dfaComposeArray y;ast;wl;i;lr;b;t;f;v;cv;val;lrb;m;astr;a2
 ⍝ Handle composition with an array
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E,'&'
 wl←wl∧~i ⍝ Update worklist
 i←i\∨/~i⌿ast[;astlarg,astrarg]∊NULL ⍝ Got data to work on?
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
     'Under construction: need to loop for more than 1'assert 1=+/i
  ⍝ We have f&varb or varb&f.
  ⍝ f may be primitive, derived, or defined.
  ⍝ We no longer tinker the raw ast entry as received.
  ⍝ Rather, we handle the invocation as recursively
  ⍝ obtained from dfaReduceDerived, etc.
  ⍝ Our "caller" will fix up the ast line that
  ⍝ contains the compose itself.
  ⍝ First, find the non-function. It is astrop or astlop.
     val←astclassVARB,astclassNC,astclassCC
     lr←,D(i⌿ast)[;astlop,astrop]
     lrb←ast[lr;astclass]∊val
     'Only 1 varb/fn today'assert 1=+/lrb
  ⍝ Built fake ast
     a2←ast
     j←i/⍳⍴i
     m←,D ast[j;lrb/astrop,astlop] ⍝ f
     m←D ast FindReferentNew m
     a2[j;lrb/astlarg,astrarg]←a2[j;lrb/astlop,astrop] ⍝ op now arg
     a2[j;astlop,astfn,astrop]←ast[m;astlop,astfn,astrop] ⍝ operand now fn
     a2[j;astrr,astrt]←ast[D a2[j;astrarg];astrank,asttype]
     k←D a2[j;astlarg]
     :If ~k∊NULL
         a2[j;astlr,astlt]←ast[k;astrank,asttype]
     :EndIf
     cv←i ExtractSubFn a2 ⍝ What we need to look at
     k←y ⋄ k[ssaast]←E a2
     j←cv dfa k ⍝ Analyze the composition
     j←D j[ssaast]
  ⍝ Merge new stuff about composed fn back into ast
  ⍝ Also, merge out results into the referent.
     astr←(i⌿ast)⍪ast[m;]
     k←astchar,astlt,astrt,astlr,astrr
     astr[;k]←2⌿(i⌿j)[;k]
     m←(i/⍳⍴i),m
     astr[;astPred]←E astPreLen⍴0 ⍝ Kill all predicates
  ⍝ (We SHOULD pull them out of the above dfa...)
  ⍝ But time is tight...
     astr←astr[⍋m;] ⍝ Sort into correct order
     j←k astmerge(E ast),(E astr),E(⍳⍴i)∊m
     wl←wl∨D j[1] ⋄ ast←D j[0]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
