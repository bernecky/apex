﻿SetPreds←{
  0∊⍴⍺ : ⍺ ⍝ Stupid APL2 treatment of empties
  preds←D ⍺[;astPred]
  preds[;⍵]←1
  z←⍺
  z[;astPred]←ER1 preds
  z
}
