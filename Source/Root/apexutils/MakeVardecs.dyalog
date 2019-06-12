MakeVardecs←{
 ⍝ Make vardec entries for names ⍵
 ⍝ and place them in ast ⍺.
 ⍝ Result is new ast, row indices for new/old vardecs
 ⍝ Remove new duplicate names. We assume that
 ⍝ SSA will do any renaming that is required.
 nms←,⍵
 ast←⍺
 nms←(~nms∊ast[;asttarget])⌿nms ⍝ Remove dups
 astr←astNewRows≢nms
 astr[;asttarget]←nms
 astr[;astclass]←astclassVARB
 astr[;astscope]←astscopeL ⍝ Local variables
 N←ast[;asttarget]⍳aststz  ⍝ End of old vardecs
 ast←(N↑ast)⍪astr⍪N↓ast
 nums←⍳≢ast ⋄ nums←nums+(nums>N)×≢astr
 ast←nums RenumberAst ast
 nums←ast[;asttarget]⍳⍵
 (ast nums)
}

