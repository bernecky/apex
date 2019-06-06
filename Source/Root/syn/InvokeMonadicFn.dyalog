 InvokeMonadicFn;astr;i;j;cls
 ⍝ Invoke stacked fn monadically, maybe
 :If (D stk[stkp-2;Stktokcl])∊clsadverb
     InvokeMonadicAdverb
 :ElseIf (D stk[stkp-2;Stktokcl])∊clsconj
     InvokeMonadicConjunction
 :Else
    ⍝ Try to make rank conj work on cnn app
     :If clsconj=D stk[stkp;Stkstate]
         i←stkpop 3 ⍝ larg fn rarg
         astr←,astNewRows 1
         astr[asttarget]←E astp
         astr[astfn]←i[1;Stkvalue]
         astr[astrarg]←i[2;Stkvalue]
         cls←D i[1;Stktokcl]
         stkpush(E i[2;Stkstate]),i[0;Stkvalue,Stktokcl]
     :Else
         i←stkpop 2 ⍝Pop two stack elements
         astr←,astNewRows 1        ⍝ Build new ast entry
         astr[asttarget]←E astp
         astr[astfn]←i[0;Stkvalue]
         astr[astrarg]←i[1;Stkvalue]
         cls←D i[1;Stktokcl]

     :EndIf
     :If cls∊clsadverb,clsconj ⍝ Adverb or conj
         ÷0 ⍝dead
         astr[astlop]←i[0;Stkvalue] ⍝ Left operand
         :If cls∊clsadverb ⍝ Pop null right operand if adverb
             j←(stkpop 1)[0;Stkvalue]
         :EndIf
         i[;1]←(i[1;Stkvalue]),(stkpop 1)[0;Stkvalue] ⍝ Adv/conj & rarg
     :EndIf
 ⍝ Under Construction: Where is astrop when we need it?
⍝⍝⍝ rankop     astr[astfn,astrarg]←i[;1] ⍝ Function and right argument
     astr[astclass]←astclassVARB
     astpush astr
     stk[stkp;]←(E Stx),(E astp-1),E'x'
     state←Stx
     stkp←stkp+1
 :EndIf
