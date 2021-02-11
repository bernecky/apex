 InvokeAdverb;astr;i;j;cls;row
 ⍝ Invoke stacked adverb
 ÷0
 i←StackPop 2 ⍝Pop two stack elements
 astr←,astNewRows 1        ⍝ Build new ast entry
 row←≢ast
 astr[asttarget]←E row
 cls←D i[1;Stktokcl]
 :If cls∊clsadverb,clsconj ⍝ Adverb or conj
     astr[astlop]←i[0;Stkvalue] ⍝ Left operand
     :If cls∊clsadverb ⍝ Pop null right operand if adverb
         j←(StackPop 1)[0;Stkvalue]
     :EndIf
     i[;1]←(i[1;Stkvalue]),(StackPop 1)[0;Stkvalue] ⍝ Adv/conj & rarg
 :EndIf
 ⍝ Under Construction: Where is astrop when we need it?
 astr[astfn,astrarg]←i[;1] ⍝ Function and right argument
 astr[astclass]←astclassVARB
 ast←ast append2Ast astr
 stk[stkp;]←(E Stx),(E row),E'x'
 state←Stx
 stkp←stkp+1
