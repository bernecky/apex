﻿ r←EmitFnCallsConstants y;fns;cv;cal;ast;sc;ctl
⍝# Emit calls for constants
 r←y
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 cv←(~dfainit ast)∧ast[;astclass]∊astclassCC,astclassNC
 cv[dfnname]←0 ⍝ Ignore fn name
 cal[dfnname;]←E''
 sc←0=D cv⌿ast[;astrank] ⍝ Scalar constants are easy
 sc←((E'CV2Parray'),E'')[sc]
 cal[cv/⍳⍴cv;calfn]←sc
 cal[cv/⍳⍴cv;calrarg]←cv⌿ast[;asttarget]
 cal[cv/⍳⍴cv;caltypes,calranks]←E''
 cal←cv EmitAssignment(E ast),(E cal)
 r←y ⋄ r[3]←E cal
