 r←DominanceFrontier cfg
 ⍝ Compute dominance frontier for cfg
 r←cfg Succ DominatorInverse cfg
 r←r∧~⍉DominatorStrict cfg
