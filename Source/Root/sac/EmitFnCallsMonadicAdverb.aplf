 r←EmitFnCallsMonadicAdverb y;fns;cv;cvm;cal;ast;ctl
⍝ Emit calls for monadic adverbs: +/⍵ +\⍵ b/⍵ b\⍵
 r←y
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 ctl←7 FragmentCode'madverbs'
 ctl←ctl⍪7 FragmentCode'scan'
 ctl←ctl⍪7 FragmentCode'replicate'
 cvm←<\(ctl FindFnOnly fns)∧ctl FindRankGen fns
 cv←∨/cvm
 :If 1∊cv
     cal[cv/⍳⍴cv;calranks]←E'' ⍝ Kill ranks
 :EndIf
 r←y ⋄ r[3]←E cal
