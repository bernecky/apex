﻿ r←ctl FindRank fns
⍝ r←incidence matrix for ctl, fns
 r←fns[;fnsranks]∘.≡ctl[;ctlranks]
