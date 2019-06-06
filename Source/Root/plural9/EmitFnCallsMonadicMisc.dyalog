﻿ r←EmitFnCallsMonadicMisc y;ast;fns;cal;cv;ctl
⍝# Emit calls for monadic misc fns
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 ctl←7 FragmentCode'mmisc'
 ctl←ctl⍪7 FragmentCode'thorn'
 ctl←ctl⍪7 FragmentCode'mstruct'
 ctl←ctl⍪7 FragmentCode'quadfi'
 ctl←ctl⍪7 FragmentCode'query'
 ctl←ctl⍪7 FragmentCode'quotequad'
 cv←∨/<\(ctl FindFn fns)∧ctl FindType fns
 cal[cv/⍳⍴cv;calranks]←E'' ⍝ No ranks in SAC
 cal←cv EmitAssignment(E ast),E cal
 r←y ⋄ r[3]←E cal
