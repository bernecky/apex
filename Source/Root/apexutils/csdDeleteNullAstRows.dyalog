﻿ r←csdDeleteNullAstRows cds;cv;nasts;bb
⍝ Delete Null rows from cds
⍝ We do this for two reaons:
⍝ a. It speeds up later phases of compilation
⍝ b. Certain code (e.g, FORRename) presumes that
⍝    the set of :PHI functions following a :FOR
⍝    are contiguous. 1996-04-08
 nasts←cds
 nasts[ssaast]←E astDeleteNullRows D cds[ssaast]
⍝ No changes to ssacfg, ssacv, ssadomt, ssadf, ssadom
 r←nasts
