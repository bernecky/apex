﻿ r←astn SemiGlobalMerge y;cv;myn;ncv;ast
⍝ Merge new semi-globals in astn into ast
⍝ astn is our callee's semiglobal list
 ast←D y[ssaast]
 cv←~dfainit ast ⋄ cv[¯1+cv⍳0]←0 ⍝ Mark new names
 myn←cv∧~ast[;astclass]∊astclassCC,astclassNC ⍝ No constants
 ncv←~astn[;asttarget]∊myn/ast[;asttarget]
 ast←((⍳1↑⍴ast)+(~cv)×+/ncv)RenumberAst ast
 ast←(cv⌿ast)⍪(ncv⌿astn)⍪(~cv)⌿ast
 ast←SemiGlobalNameSort ast ⍝ Canonical order permits
⍝ simpler code generation on caller/callee sides
 ast←astn SemiGlobalNamescope ast ⍝ Fix callers' name scope
 r←y ⋄ r[ssaast]←E ast
