 InvokeMonadicFn;astr;i;j;cls;row;nms;stke
 ⍝ Invoke stacked fn monadically, maybe
 :If 2 isStrand stk ⍝ If rarg is strand, destrand it
     nms←')'StrandItems 2
     (ast astr stk)←nms BuildStrandAssigns(ast 1 stk)
     stke←StackPop 3+⍴nms ⍝ Pop nms, ( ) and the fn
     stk←stk StackPush stke[2 0;] ⍝ Push (fn dummyarg)
     ast←ast append2Ast astr
 :EndIf

 :If (D stk[stkp-2;Stktokcl])∊clsadverb
     InvokeMonadicAdverb
 :ElseIf (D stk[stkp-2;Stktokcl])∊clsconj
     InvokeMonadicConjunction
 :Else
    ⍝ Bog-standard foo ⍵
    ⍝⍝ Try to make rank conj work on cnn app
    ⍝⍝ :If clsconj=D stk[stkp;Stkstate]
    ⍝⍝     i←stkpop 3 ⍝ larg fn rarg
    ⍝⍝     astr←,astNewRows 1
    ⍝⍝     row←≢ast
    ⍝⍝     astr[asttarget]←E row
    ⍝⍝     astr[astfn]←i[1;Stkvalue]
    ⍝⍝     astr[astrarg]←i[2;Stkvalue]
    ⍝⍝     cls←D i[1;Stktokcl]
    ⍝⍝     stk←stk StackPush (E i[0;Stkstate]),i[2;Stkvalue,Stktokcl]
     i←StackPop 2 ⍝Pop two stack elements
     astr←,astNewRows 1        ⍝ Build new ast entry
     row←≢ast
     astr[asttarget]←E row
     astr[astfn]←i[0;Stkvalue]
     astr[astrarg]←i[1;Stkvalue]
    ⍝⍝ cls←D i[1;Stktokcl]


  ⍝⍝    :If cls∊clsadverb,clsconj ⍝ Adverb or conj
  ⍝⍝      astr[astlop]←i[0;Stkvalue] ⍝ Left operand
  ⍝⍝       :If cls∊clsadverb ⍝ Pop null right operand if adverb
  ⍝⍝           j←(StackPop 1)[0;Stkvalue]
  ⍝⍝       :EndIf
  ⍝⍝       i[;1]←(i[1;Stkvalue]),(StackPop 1)[0;Stkvalue] ⍝ Adv/conj & rarg
  ⍝ Under Construction: Where is astrop when we need it?
⍝⍝⍝ rankop     astr[astfn,astrarg]←i[;1] ⍝ Function and right argument

     astr[astclass]←astclassVARB
     ast←ast append2Ast astr
     state←Stx
     stk←stk StackPush(E state),(E row),E clsexpn
 :EndIf
