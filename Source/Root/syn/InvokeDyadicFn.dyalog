 InvokeDyadicFn;i;astr;lf;fn;ro;op
 ⍝ Call function dyadically.
 :If (D stk[stkp-3;Stktokcl])∊clsadverb
     InvokeDyadicAdverb
 :ElseIf (D stk[stkp-3;Stktokcl])∊clsconj
     InvokeDyadicConjunction
 :Else
     lf←stkpop 1 ⍝Pop larg
     fn←stkpop 1 ⍝ Pop function and/or lop of conjunction
     astr←,astNewRows 1
     astr[asttarget]←E astp
     astr[astlarg]←lf[0;1]
     astr[astfn]←fn[0;Stkvalue]
     :If (D fn[0;Stktokcl])∊clsconj,clsadverb
  ⍝ Conjunction or adverb
         ÷0 ⍝Dead
         ro←stkpop 2 ⍝ Conjunction and Right operand
         astr[astfn,astrop]←ro[;Stkvalue]
         astr[astlop]←fn[0;Stkvalue] ⍝ Left operand
     :EndIf
     astr[astrarg]←(stkpop 1)[0;Stkvalue] ⍝ Right argument
     astr[astclass]←astclassVARB
     Append2Ast astr
     stk[stkp;]←(E Stx),(E astp-1),E'x'
     state←Stx
     stkp←stkp+1
 :EndIf
