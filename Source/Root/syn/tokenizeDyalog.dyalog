﻿ r←cv tokenizeDyalog y;kwds;i
 ⍝ Mark Dyalog ctl structure keywords
 ⍝ Keywords have all been converted to lower case
 kwds←ControlStructuresDyalog
 r←cv∧∨⌿D(E LC y)ssmark¨kwds
