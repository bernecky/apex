 r←ICall ast;i
 ⍝ Get indices of fns called by ast
 i←astclassDFN,astclassMFN,astclassNFN
 r←1↓(ast[;astclass]∊i)/⍳1↑⍴ast ⍝ Ignore fn itself
 r←(~ast[r;asttarget]∊sysQQ)/r ⍝ Ignore APL oddities
