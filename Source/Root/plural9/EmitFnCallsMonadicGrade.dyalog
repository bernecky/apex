﻿ r←EmitFnCallsMonadicGrade y;ast;fns;cal;cv;cvm;ctl;fn;sc
⍝# Emit calls for monadic upgrade and downgrade
⍝# This tinkers function name for
⍝# special cases, like ⍋permutation vector
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 r←y ⍝ Assume no work
 ctl←7 FragmentCode'mgrade'
 cvm←<\(ctl FindFn fns)∧ctl FindRankGen fns
 cv←∨/cvm
 cal←cv EmitAssignment(E ast),E cal
 r[3]←E cal
