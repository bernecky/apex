 r←x SGIRemove ast;cv;nms;p;tar;k;fcv;ptar;pv
⍝ Delete :GI ast entries from the fncall at cv
 cv←D x[0]
 nms←D x[1]
 r←ast
 :While 1∊cv
     fcv←<\cv
     p←fcv SGIMark ast             ⍝ Mark all SGI for first call
     ⍝⍝ DEAD :If 1∊p                       ⍝ Stupid APL2 prototypes
     tar←D p⌿r[;astrarg]       ⍝ SSA entry
     tar←D r[tar;asttag]       ⍝ Un-SSA entry
     'trying to delete non-exist SG!'assert∧/nms∊r[;asttarget]
     ptar←~tar∊NULL
     'Did not expect NULL tar entry'assert∧/ptar
     pv←⍋ptar
     r[p/⍳⍴p;]←r[(p/⍳⍴p)[pv];] ⍝ Reorder so live entries are first
     k←(p⍳1)+⍳+/p                ⍝ new live links
     r[k;astparms]←(¯1↓k+1),NULL ⍝ Generate new links, terminate chain
     r[k;asttag]←k               ⍝ Repair tags
     ⎕←'fix SGIRemove for function: ',ast[0;asttarget]
     r[p/⍳⍴p;]←E NULL            ⍝ Kill dead entries
           ⍝ Something about pv

     :If 1 ⍝⍝⍝⍝⍝  ∧/tar                   ⍝ If all entries killed
         k←D r[fcv/⍳⍴fcv;astparms]
         r[fcv/⍳⍴fcv;astparms]←NULL   ⍝  kill list hdr and
         r[k;]←E NULL            ⍝  old list header
     :EndIf
     ⍝⍝⍝ DEAD:EndIf
     cv←cv∧~fcv
 :EndWhile
 r←astDeleteNullRows r
