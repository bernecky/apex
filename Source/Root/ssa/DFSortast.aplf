 r←DFSortast ctasts;newast;cm;leaf;work;pv;ct;asts
 ⍝# Sort asts vector into Depth-First order.
 ⍝ This is required for ssa SemiGlobalAnalysis to work properly
 ct←D ctasts[0]
 asts←D ctasts[1]
 pv←(1↑⍴asts)⍴¯1 ⋄ cm←0≠D ct[1] ⍝ Connectivity matrix
 ⍝ We sort from leaves upwards
 cm←cm∧~(⍴cm)⍴(1+1↑⍴cm)↑1 ⍝ Ignore recursion in self
 work←(1↑⍴cm)⍴1 ⍝ These have to be looked at
 :While 1∊work
     leaf←work∧~∨/cm∧(⍴cm)⍴work ⍝ These guys don't call anyone
     pv[(+/~work)+⍳+/leaf]←leaf/⍳⍴pv
     work←work∧~leaf
 :EndWhile
 r←(E pv ctPermute ct),E asts[pv] ⍝ Permute ct and asts
 r←DeleteUnreferencedFns r
