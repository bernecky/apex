MakeVardecs←{
 ⍝ Make vardec entries for names ⍵
 ⍝ and place them in ast from ⍺.
 ⍝ Result is new (ast stk, row indices for new/old vardecs)
 ⍝ Remove new duplicate names. We assume that
 ⍝ SSA will do any renaming that is required.
 nms←,⍵
 (ast stk scope)←⍺
 nms←(~nms∊ast[;asttarget])⌿nms ⍝ Remove dups
 astr←astNewRows≢nms
 astr[;asttarget]←nms
 astr[;astclass]←astclassVARB
 astr[;astscope]←scope ⍝ Local variables vs. semi-globals
 N←ast[;asttarget]⍳aststz  ⍝ End of old vardecs
 ast←(N↑ast)⍪astr⍪N↓ast
 nums←⍳≢ast 
 nums←nums+(nums>N)×≢astr
 ast←nums RenumberAst ast
 stk←nums RenumberStk stk
 nums←ast[;asttarget]⍳⍵
 (ast stk nums)
}

