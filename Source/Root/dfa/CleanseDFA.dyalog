﻿ r←CleanseDFA ast;pv
⍝ Discard all dfa-derived information in newly cloned fn
 r←ast
 pv←~ast[;astclass]∊astclassCC,astclassNC ⍝ Constants are OK
 pv←pv∧dfainit ast
 pv[dfnlarg,dfnrarg,dfnres]←1             ⍝ Reset args and result
 r[pv/⍳⍴pv;asttype,astrank,astvalue]←NULL
 r[pv/⍳⍴pv;astPred]←E astPredLen⍴0
