﻿ r←c gett srctok;i;src;tok;prim;nm
 ⍝ Get next token as [src;tok;srclength]
 src←D srctok[0]
 tok←D srctok[1]
 i←-+/∧\(⌽(c+1)↑tok)=tok[c]
 prim←clsassign,clsrbr,clslbr,clssep,clsfn,clsgoto
 prim←prim,clscolon,clssemic,clslpar,clsqq,clsrpar
 :If tok[c]∊prim ⍝ Primitives always 1 char long
     i←¯1
 :EndIf
 nm←st stlookup E i↑(c+1)↑src
 r←nm,(E tok[c]),E|i
