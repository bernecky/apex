 InvokeNiladicFn ns;astr;i;j;row
 ⍝ Call stacked verb niladically, set new state ns
 i←stkpop 1 ⍝ Pop stack element
 astr←,astNewRows 1 ⍝ Build new ast entry
 row←≢ast
 astr[asttarget]←E row
 ⍝ Under Construction: Where is astrop when we need it?
 astr[astfn]←i[;1] ⍝ Function (Quad, quote-quad, ⎕av, ⎕ts)
 astr[astclass]←astclassVARB
 ast←ast append2Ast astr
 stk[stkp;]←(E Stx),(E row),E'x'
 state←ns
 stkp←stkp+1
