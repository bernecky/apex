 InvokeAdverb;astr;i;j;cls
 ⍝ Invoke stacked adverb
 ÷0
 i←stkpop 2 ⍝Pop two stack elements
 astr←,astNewRows 1        ⍝ Build new ast entry
 astr[asttarget]←E astp
 cls←D i[1;Stktokcl]
 :If cls∊clsadverb,clsconj ⍝ Adverb or conj
     astr[astlop]←i[0;Stkvalue] ⍝ Left operand
     :If cls∊clsadverb ⍝ Pop null right operand if adverb
         j←(stkpop 1)[0;Stkvalue]
     :EndIf
     i[;1]←(i[1;Stkvalue]),(stkpop 1)[0;Stkvalue] ⍝ Adv/conj & rarg
 :EndIf
 ⍝ Under Construction: Where is astrop when we need it?
 astr[astfn,astrarg]←i[;1] ⍝ Function and right argument
 astr[astclass]←astclassVARB
 Append2Ast astr
 stk[stkp;]←(E Stx),(E astp-1),E'x'
 state←Stx
 stkp←stkp+1
