﻿ r←ast KnowValue k
⍝ Predicate for known value for ast rows k
 r←ast[;astPred] ⍝ Stupidity in APL2 prototyping
 r←(D r[k])[;astPredKnowValue]
