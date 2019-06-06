 r←x SGIRemove ast;cv;nms;p;tar;k;fcv
⍝ Delete :GI ast entries from the fncall at cv
 cv←D x[0]
 nms←D x[1]
 r←ast
 :While 1∊cv
     fcv←<\cv
     p←fcv SGIMark ast
     :If 1∊p                     ⍝ Stupid APL2 prototypes
         tar←D p⌿r[;astrarg]       ⍝ SSA entry
         tar←D r[tar;asttag]       ⍝ Un-SSA entry
         'trying to delete non-exist SG!'assert∧/nms∊r[;asttarget]
         tar←r[tar;asttarget]∊nms  ⍝ Kill these entries
         r[(p\tar)/⍳⍴p;]←E NULL      ⍝ Kill dead entries
         r[p/⍳⍴p;]←r[(p/⍳⍴p)[⍋tar];] ⍝ Reorder so live entries are first
         k←(p⍳1)+⍳+/~tar             ⍝ new live links
         r[k;astparms]←(¯1↓k+1),NULL ⍝ Generate new links, terminate chain
         r[k;asttag]←k               ⍝ Repair tags
         :If ∧/tar                   ⍝ If all entries killed
             k←D r[fcv/⍳⍴fcv;astparms]
             r[fcv/⍳⍴fcv;astparms]←NULL   ⍝  kill list hdr and
             r[k;]←E NULL               ⍝  old list header
         :EndIf
     :EndIf
     cv←cv∧~fcv
 :EndWhile
