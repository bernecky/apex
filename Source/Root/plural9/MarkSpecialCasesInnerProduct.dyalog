﻿ r←MarkSpecialCasesInnerProduct fns
⍝ Mark special cases for inner product
 r←IsCaseTRANSPOSE fns
 r←IsCaseSTAR r
 r←IsCaseSTARLIKE r
 r←IsCaseQuickStop0 r
