﻿ r←GenerateDF y
 ⍝ Generate DominanceFrontiers for cfg
 r←y
 r[ssadf]←E DominanceFrontier D y[ssacfg]
