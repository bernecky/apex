 r←x SGIRemoveSSA ast;cv;nms;p;tar;k
⍝ Delete :GI ast entries from the fncall at cv
 cv←D x[0]
 nms←D x[1]
 'too stupid to do more than one'assert 1≥+/cv
 p←cv SGIMark ast            ⍝ Find :GI entries
 tar←D p⌿ast[;astrarg]
 'trying to delete non-exist SG!'assert∧/nms∊ast[;asttarget]
 tar←UnSSAName¨ast[tar;asttarget]
 tar←tar∊nms  ⍝ Kill these entries
 r←ast
 :If 1∊tar
     r[(p\tar)/⍳⍴p;]←astNewRows+/tar ⍝ Kill dead entries
     r[p/⍳⍴p;]←r[(p/⍳⍴p)[⍋tar];] ⍝ Reorder so live entries are first
     k←(p⍳1)+⍳+/~tar             ⍝ new live links
     r[k;astparms]←(¯1↓k+1),NULL ⍝ Generate new links, terminate chain
     r[k;asttag]←k               ⍝ Repair tags
     :If 0=⍴k                    ⍝ If no more semi-globals,
         k←D r[cv/⍳⍴cv;astparms]    ⍝   kill list hdr and
         r[cv/⍳⍴cv;astparms]←E NULL ⍝   old list header
         r[k;]←astNewRows⍴k
     :EndIf
 :EndIf
