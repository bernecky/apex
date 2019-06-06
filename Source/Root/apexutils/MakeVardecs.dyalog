MakeVardecs←{
 ⍝ Make vardec entries for names ⍵
 ⍝ and place them in ast ⍺.
 ⍝ Result is new ast, row indices for added vardecs
 ⍝ Complain if names are already there
 astr←astNewRows≢⍵
 astr[;asttarget]←⍵
 astr[;astclass]←astclassVARB
 astr[;astscope]←astscopeL ⍝ Local variables
 N←ast[;asttarget]⍳aststz  ⍝ End of old vardecs
 ast←(N↑ast)⍪astr⍪N↓ast
 nums←⍳≢ast ⋄ nums←nums+(nums>N)×≢astr
 ast← nums RenumberAst ast
 nums←N+⍳≢astr
 (ast nums)
}

