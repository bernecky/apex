 r←cv tokenizeDyalog y;kwds;i
 ⍝ Mark Dyalog ctl structure keywords
 ⍝ Keywords have all been converted to lower case
 kwds←ControlStructuresDyalog
 r←cv∧∨⌿D(E y)ssmark¨kwds
