﻿ r←ast IndexList plnk;nextp;lnk;p
 ⍝ Get list of indices for index
 ⍝ expression at row p of ast, linking w/lnk
 ⍝ typically astrarg, astparm, or astImplicitResult
 p←nextp←plnk[0]
 lnk←plnk[1]
 r←⍳0
 :Repeat
     nextp←D ast[p;lnk]
     r←r,p
     p←nextp
 :Until NULL=nextp
 r←1↓r
