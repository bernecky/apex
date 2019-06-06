 r←GenerateDOM y;cfg
 ⍝ Generate dominators for ast
 r←y
 r[ssadom]←E Dominator cfg←D y[ssacfg]
 r[ssadomt]←E DominatorTree cfg
