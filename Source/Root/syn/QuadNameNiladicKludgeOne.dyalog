﻿ r←nfn QuadNameNiladicKludgeOne y;src;tok;loc;hit;row;col;rowcol
⍝ Replace tokenclass for one nfn (⎕ts or ⎕av today)
 src←D y[0]
 tok←D y[1]
 r←tok
 loc←,nfn⍷src            ⍝ Mark all potential hits
 :Repeat
     hit←loc⍳1
     :If hit<⍴loc
         loc[hit]←0
         rowcol←,(⍴r)⊤hit
         row←rowcol[0]
         col←rowcol[1]
         hit←r[row;col+⍳⍴nfn]∧.=clsqdnm ⍝ Sysfn vs quoted string, e.g.
         :If hit
             r[row;col+⍳⍴nfn]←clsNilFn
         :EndIf
     :EndIf
 :Until ~1∊loc
