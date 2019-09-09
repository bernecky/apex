﻿ InvokeMonadicConjunction;astr;lop;conj;rop;rarg;row
 ⍝ Invoke conjunction monadically
 lop←StackPop 1 ⍝ left operand
 conj←StackPop 1 ⍝ The conjunction
 rop←StackPop 1 ⍝ right operand
 rarg←StackPop 1 ⍝ right arg to derived fn
 astr←,astNewRows 1
 row←≢ast
 astr[asttarget]←E row
 astr[astlop]←lop[0;Stkvalue]
 astr[astfn]←conj[0;Stkvalue]
 astr[astrop]←rop[0;Stkvalue]
 astr[astrarg]←rarg[0;Stkvalue]
 astr[astclass]←astclassVARB
 ast←ast append2Ast astr
 stk[stkp;]←(E Stx),(E row),E'x'
 state←Stx
 stkp←stkp+1
