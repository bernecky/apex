 InvokeDyadicAdverb;astr;lop;adv;rarg;rop;row
 ⍝ Invoke adverb dyadically
 larg←stkpop 1 ⍝ left argument to derived fn
 lop←stkpop 1 ⍝ left operand
 adv←stkpop 1 ⍝ The adverb
 rop←stkpop 1 ⍝ The (null) right operand
 rarg←stkpop 1 ⍝ right arg to derived fn
 'rbe kant kode'assert NULL=D rop[0;Stkvalue]
 astr←,astNewRows 1
 row←≢ast
 astr[asttarget]←E row
 astr[astlarg]←larg[0;Stkvalue]
 astr[astlop]←lop[0;Stkvalue]
 astr[astfn]←adv[0;Stkvalue]
 astr[astrarg]←rarg[0;Stkvalue]
 astr[astclass]←astclassVARB
 ast←ast append2Ast astr
 stk[stkp;]←(E Stx),(E row),E'x'
 state←Stx
 stkp←stkp+1
