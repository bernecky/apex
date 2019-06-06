﻿ r←pfatFunctionRank y;i;j
 ⍝ Return Function Rank for APL primitive(s) y.
 ⍝ v is valence (1 for monadic, 2 for dyadic)
 i←(pfat[;0]≠'*')⌿pfat ⍝ Ignore comments
 j←,i[pfatSymbol y;11+⍳9]
 j[(j='_')/⍳⍴j]←MaxRank ⍝ Infinite rank
 r←((⍴,y),3)⍴quadfi j
