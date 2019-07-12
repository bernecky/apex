﻿ r←x SGIRemove ast;cv;nms;p;tar;k;fcv;gis;pv;le;de
⍝ Remove :GI ast entries for nms from the fncall at cv
 cv←D x[0]
 nms←D x[1]
 r←ast
 :While 1∊cv
     gis←cv⍳1
     p←ast ParmIndices gis          ⍝ :GI index chain
     tar←ast UnSSA ast ParmList gis ⍝ :GI names to delete
     pv←r[tar;asttarget]∊nms
     de←pv/p                        ⍝ Dead :GI entries
     le←(~pv)/p                     ⍝ Live :GI entries
     r[gis;astparms]←0⌷le,NULL      ⍝ Point fncall at first live :GI, if any
     r[le;astparms]←1↓le,NULL       ⍝ Link live entries
     r[de;]←NULL                    ⍝ Kill dead entries
     cv[gis]←0
 :EndWhile
