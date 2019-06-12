 InvokeDyadicConjunction;astr;lop;conj;rop;rarg
 ⍝ Invoke conjunction dyadically
 larg←stkpop 1 ⍝ Left arg to derived fn
 lop←stkpop 1 ⍝ left operand
 conj←stkpop 1 ⍝ The conjunction
 rop←stkpop 1 ⍝ right operand
 rarg←stkpop 1 ⍝ right arg to derived fn
 astr←,astNewRows 1
 astr[asttarget]←E astp
 astr[astlarg]←larg[0;Stkvalue]
 astr[astlop]←lop[0;Stkvalue]
 astr[astfn]←conj[0;Stkvalue]
 astr[astrop]←rop[0;Stkvalue]
 astr[astrarg]←rarg[0;Stkvalue]
 astr[astclass]←astclassVARB
 Append2Ast astr
 stk[stkp;]←(E Stx),(E astp-1),E'x'
 state←Stx
 stkp←stkp+1
