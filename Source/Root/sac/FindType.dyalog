﻿ r←ctl FindType fns;ltn;lts;rtn;rts;lt;rt;typ;ztn;zts;zt
 ⍝ Find fragments for rank
 ⍝ r= incidence matrix for prim, nms
 typ←UC D fns[;fnstypes]
 typ←typ,((1↑⍴typ),3)⍴'?' ⍝ Avoid index error below
 ltn←typ[;,fnstypeslarg] ⍝ Needed left types
 rtn←typ[;,fnstypesrarg] ⍝ Needed right types
 ztn←typ[;,fnstypesz]    ⍝ Needed result types
 lts←UC D ctl[;ctltypel] ⍝ Supplied left types
 rts←UC D ctl[;ctltyper] ⍝ Supplied right types
 zts←UC D ctl[;ctltypez] ⍝ Supplied result types
 lt←lts∨.=(¯1↑⍴lts)⌿⍉ltn
 rt←rts∨.=(¯1↑⍴rts)⌿⍉rtn
 zt←zts∨.=(¯1↑⍴zts)⌿⍉ztn
 r←⍉lt∧rt∧zt ⍝ Pick best match
