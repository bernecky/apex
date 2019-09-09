 doindexass;astr;m;row
⍝ Indexed assign
 ⍝ 1995-07-08. We are having troubles with FOR loops
 ⍝ vs indexed assign vs ssa. The result array is
 ⍝ not getting emited as the result of the loop.
 ⍝ We are going to attempt to circumvent the problem
 ⍝ by emitting a temp for the indexed assign target,
 ⍝ then assigning the temp to the indexee.
 state←Stx ⍝ new state is expn (after indexing)
 astr←,astNewRows 1 ⍝ Now build index itself
 m←StackPop 3 ⍝ Pop target,index list, arrow
 ⍝ rhs left on stack as result of indexing
 astr[astrop]←stk[stkp-1;Stkvalue] ⍝ rhs
 astr[astfn]←E,']'
 astr[astlarg,asttarget]←m[0;Stkvalue] ⍝index target
 astr[astrarg]←m[1;Stkvalue] ⍝ Index list
 astr[astclass]←astclassVARB
 astr←(2,⍴astr)⍴astr
 row←≢ast
 astr[0;asttarget]←E row
 astr[1;astlarg,astlop,astrop]←NULL
 astr[1;astfn]←E,'←'
 astr[1;astrarg]←E row
 ast←ast append2Ast astr
 state←Stx ⍝ Always end up in expression state
