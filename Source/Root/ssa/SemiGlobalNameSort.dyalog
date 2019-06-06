﻿ r←SemiGlobalNameSort ast;cv;pv;uv;astr
⍝ Sort semiglobal names in ast
⍝ The idea here is to have all asts with their
⍝ semiglobals sorted the same way, so that
⍝ calls can simply use compress to generate
⍝ parameter lists and function definitions
⍝ without worrying about their respective orderings.
⍝
 cv←~ast[;astscope]∊astscopeL ⍝ All semiglobals
 cv[dfnres,dfnlarg,dfnname,dfnrarg]←0 ⍝ Don't dork with fixed entries
 cv←cv∧~dfainit ast
 uv←⎕AV⍋D cv⌿ast[;asttarget] ⍝ Ordering
 pv←⍳1↑⍴ast ⍝ Permute the ordering
 pv[(cv/⍳⍴cv)[uv]]←cv/⍳⍴cv
 astr←pv RenumberAst ast
 astr[cv/⍳⍴cv;]←(cv⌿ast)[uv;]
 r←astr
