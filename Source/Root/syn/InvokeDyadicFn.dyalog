 InvokeDyadicFn;i;astr;lf;fn;ro;op;row
 ⍝ Call function dyadically.
 :If (D stk[stkp-3;Stktokcl])∊clsadverb
     InvokeDyadicAdverb
 :ElseIf (D stk[stkp-3;Stktokcl])∊clsconj
     InvokeDyadicConjunction
 :Else ⍝ Vanilla dyadic fn
     lf←stkpop 1 ⍝Pop larg
     fn←stkpop 1 ⍝ Pop function
     astr←,astNewRows 1
     row←≢ast
     astr[asttarget]←E row
     astr[astlarg]←lf[0;1]
     astr[astfn]←fn[0;Stkvalue]
     astr[astrarg]←(stkpop 1)[0;Stkvalue] ⍝ Right argument
     astr[astclass]←astclassVARB
     ast←ast append2Ast astr
     stk[stkp;]←(E Stx),(E row),E'x'
     state←Stx
     stkp←stkp+1
 :EndIf
