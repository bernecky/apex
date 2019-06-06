﻿ r←EmitFnCallsDyadicGenericPrimitive y;fns;cv;cal;ast;ctl;cvm
⍝# Emit calls for generic dyadic fns with no fancy needs.
 r←y
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 ctl←7 FragmentCode'dstruct'
 ctl←ctl⍪7 FragmentCode'dmisc'
 ctl←ctl⍪7 FragmentCode'catlam'
 ctl←ctl⍪7 FragmentCode'reshape'
 ctl←ctl⍪7 FragmentCode'dgrade'
 cvm←(ctl FindFn fns)∧ctl FindType fns
 cvm←cvm∧ctl FindRankGen fns
 cv←∨/<\cvm∧ctl FindSpecialCases fns
 cal[cv/⍳⍴cv;calranks]←E'' ⍝ No rank specifier!
 cal←cv EmitAssignment(E ast),E cal
 r←y ⋄ r[2]←E fns ⋄ r[3]←E cal
