 r←astloprop AddPAEntry ast;cv;b;cvr;ast1;op;m;i;nast;k
⍝# Add :PA and function invocation entries for f or g of d conj g.
⍝ 2006-02-04 Link adv/conj operands
⍝ to new f and g entries. This will permit those
⍝ The :PA entries represent the left and right arguments to
⍝ the f and g operands, as filled in by the adv/conj.
 cv←ast[;astfn]∊ER1 mcb'/⌿\⍀.⍤' ⍝ Find adverbs & conjunctions
 b←cv/ast[;astloprop] ⍝ f or g in f.g
⍝ Select primitive, defined, and derived fns
 b←(ast IsDFun b)∨~isnum b
 cvr←cv\b
 :If 1∊cvr
     op←cvr⌿ast[;astloprop]
 ⍝ Generate :PA entries
     ast1←astNewRows 3×⍴op ⍝ New ast rows
     ast1[;astfn]←E':PA'
     ast1[;astclass]←E astclassLFN ⍝ :PA row class. (Not exactly right...)
     m←((3×⍴op)⍴0 0 1)/⍳3×⍴op
     ast1[m;astfn]←op ⍝ The fn we're invoking
 ⍝ Probably easier to make caller patch astclass for monadic entries?
     m←(⍳1↑⍴ast)+0,¯1↓+\cvr\3 ⍝ Renumber existing ast entries
     nast←m RenumberAst ast
     k←1+cvr\3 ⍝ Expand for new entries
     nast←k⌿nast
     m←k/cvr ⍝ New line #s
     m←(m\(+/m)⍴0 1 1 1)/⍳⍴m ⍝ New :PA and f entries are here
     ast1[;asttarget]←ER0 m ⍝ Target and source
     i←((⍴m)⍴1 1 0)/m ⍝ New sources
     i←((0.5×⍴i),2)⍴i
     ast1[((⍴m)⍴0 0 1)/⍳⍴m;astlarg,astrarg]←i
     b←cvr/⍳⍴cvr              ⍝ New indices of adv/conj entries
     b←b+3×⍳⍴b
     nast[b FindTail nast;astloprop]←b+3
     nast[,b∘.+1 2 3;]←ast1 ⍝ Insert new rows
     ast←nast
 :EndIf
 r←ast
