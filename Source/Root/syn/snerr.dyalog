 snerr;i
 ⍝ Error state.
 ⎕←'Syntax error in source program at: '
 ⎕←c seecs(E src),E tok
÷0
 state←Stz ⍝ New state is error (skips tokens)
 c←¯1
