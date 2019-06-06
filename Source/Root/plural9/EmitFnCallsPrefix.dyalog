 r←EmitFnCallsPrefix y;fns;cv;cal;ast;sc;ctl
⍝# Eliminate prefix for non-constants
 r←y
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 cv←(~dfainit ast)∧~ast[;astclass]∊astclassCC,astclassNC
 cal[cv/⍳⍴cv;]←E''
 r←y ⋄ r[3]←E cal
