﻿ r←ast GenArg args
 ⍝ Generate argument names for fn calls
 r←ast TargetName args
 r←args DeleteTargetNulls r
