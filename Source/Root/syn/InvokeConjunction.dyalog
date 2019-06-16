﻿ InvokeConjunction;i;astr;lf;fn;ro;op;row
 ⍝ Invoke conjunction
 ÷0
 lf←stkpop 1 ⍝Pop larg
 fn←stkpop 1 ⍝ Pop function and/or lop of conjunction
 row←≢ast
 astr←,astNewRows 1
 astr[asttarget]←E row
 astr[astlarg]←lf[0;1]
 astr[astfn]←fn[0;Stkvalue]
 ÷0
 :If (D fn[0;Stktokcl])∊clsconj,clsadverb
  ⍝ Conjunction or adverb
     ÷0
     ro←stkpop 2 ⍝ Conjunction and Right operand
     astr[astfn,astrop]←ro[;Stkvalue]
     astr[astlop]←fn[0;Stkvalue] ⍝ Left operand
 :EndIf
 astr[astrarg]←(stkpop 1)[0;Stkvalue] ⍝ Right argument
 astr[astclass]←astclassVARB
 ast←ast append2Ast astr
 stk[stkp;]←(E Stx),(E row),E'x'
 state←Stx
 stkp←stkp+1
