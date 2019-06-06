﻿ r←x SGORemove ast;cv;nms;p;tar;links;nast;fcv
⍝ Delete :GO ast entries from fncalls at cv
⍝ These are for calls of a single function.
⍝ It would likely make more sense to blow away ALL the
⍝ :GO entries, and rebuild them from scratch... 2007-04-22
 cv←D x[0]
 nms←D x[1]                      ⍝ Names to delete
 p←cv SGOMarkAll ast
 r←ast
 :While 1∊p
     fcv←<\p
     p←p∧~fcv
     :If 1∊fcv
         tar←D fcv⌿ast[;asttarget]   ⍝ SSA entry
         tar←D ast[tar;asttag]       ⍝ Un-SSA entry
         tar←~ast[tar;asttarget]∊nms ⍝ Keep these entries
         nast←(fcv\tar)⌿ast
         :If 1∊tar                   ⍝ Cozy-up any remaining entries
             links←¯1+fcv pplusreduce fcv\tar ⍝ New links, almost
             'crap if some vanish only'assert∧/tar
             links←(1+fcv/⍳⍴fcv)+¨⍳¨links
             links←D Raze⍉links,¨E NULL
             nast[;asttag]←links
             nast[;astparms]←links+links≠NULL ⍝ build chains
         :EndIf
         r[fcv/⍳⍴fcv;]←E NULL        ⍝ Kill all old :GO entries
         r[(+/tar)⍴fcv/⍳⍴fcv;]←nast  ⍝ Insert new :GO entries
         :If 0∊⍴nast                 ⍝ All :GO gone
             r[cv/⍳⍴cv;astImplicitResult]←NULL
             'This is crap if some vanish and others do not'assert~∧/tar
         :EndIf
     :EndIf
 :EndWhile
