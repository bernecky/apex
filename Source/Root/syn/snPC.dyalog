 snPC;j;astr;row
 ⍝ Left parenthesis left of naked conj
 ⍝ Locate matching right paren, pop intervening stuff,
 ⍝ Emit it, and push the resulting derived fn.
 j←stkpop 1+(⌽stk[⍳stkp;1])⍳E')'
 'Maybe source program syntax error'assert j[0;0]∊(E StC),E StV
 astr←,astNewRows 1 ⍝ Build new ast row
 astr[astlop,astfn,astrop]←j[0 1 2;1]
 astr[astclass]←E StV
 row←≢ast
 astr[asttarget]←E row
 ast←ast append2Ast astr
 stk[stkp;]←(E clsfn),(E row),E clsconj
 stkp←stko+1
 stk[stkp;0]←E clsfn ⍝ Now naked verb from parens
 state←Sto ⍝ Outside the parens, the naked
 ⍝conj is just a conj (op),e . g .,x(+.×) y
