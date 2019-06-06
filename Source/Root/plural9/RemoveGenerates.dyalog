﻿ r←RemoveGenerates sis;cv;g;gen;fns;fn;nl
⍝# Remove %Generate statements from a code fragment
⍝# Result is updated code fragment, Generate statements
 g←'%Generate'
 cv←g⍷sis
 fns←(0,fnscols)⍴E'' ⍝ Assume no work
 :If 1∊cv
     nl←sis=NL
     cv←(~nl)∧(¯1⌽nl)porscan cv
     gen←cv/sis
     gen←D Raze(E','),¨(E⍴g)↓¨(g⍷gen)PartitionedEnclose gen
     gen←squeeze¨1↓¨(gen=',')PartitionedEnclose gen
     gen←(((⍴gen)÷6),6)⍴gen ⍝ Undocumented # cols in %Generate entry
 ⍝ Kludge to turn mpyDDD ($FRVALUE in dcon) into mpy, etc.
     fn←gen[;0]
     gen[;0]←(fn=¨LC¨fn)ReplicateEach fn ⍝ Assumes all jsymb are lower case
     fns←((1↑⍴gen),fnscols)⍴E''
     fns[;fnslop,fnsfn,fnstypes,fnsranks,fnsspec,fnscomtyp]←gen
 :EndIf
 r←(E(~cv)/sis),E fns
