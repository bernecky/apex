 InvokeNiladicFn ns;astr;i;j
 ⍝ Call stacked verb niladically, set new state ns
 i←stkpop 1 ⍝ Pop stack element
 astr←,astNewRows 1 ⍝ Build new ast entry
 astr[asttarget]←E astp
 ⍝ Under Construction: Where is astrop when we need it?
 astr[astfn]←i[;1] ⍝ Function (Quad, quote-quad, ⎕av, ⎕ts)
 astr[astclass]←astclassVARB
 astpush astr
 stk[stkp;]←(E Stx),(E astp-1),E'x'
 state←ns
 stkp←stkp+1
