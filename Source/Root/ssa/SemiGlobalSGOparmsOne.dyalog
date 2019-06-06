﻿ r←ast SemiGlobalSGOparmsOne y;astr;tar;n;rv;pv;msg;cs;sg
⍝# Mark sub-function calls in this ast w/their SGO entries
 cs←D y[0]
 sg←D y[1]
 msg←D 0⊃¨⍴¨sg          ⍝ # semiglobals per call
 :If 0≠+/msg            ⍝ Any work?
     astr←astNewRows+/msg ⍝ Build :GO ast rows
     astr[;astfn]←E':GO'   ⍝ Semi-globals out from the fn we're calling
     tar←ast[;asttarget]⍳D Raze⍉sg ⍝ Parameters
     astr[;asttarget]←ER0 tar
   ⍝ Adjust row #s for new rows
     astr[;astrarg]←ER0 msg/(0,¯1↓+\msg)+cs/⍳⍴cs
     n←(⍳1↑⍴ast)+0,¯1↓+\cs\msg     ⍝ New row numbers
     ast←n RenumberAst ast
     rv←1+cs\msg                   ⍝ Replication vector for ast
     ast←rv⌿ast                    ⍝ Insert new ast rows
     pv←rv/n≠¯1+(1↓n),1+¯1↑n       ⍝ Mark fn calls old and new
     cs←D Raze⍉rv↑¨rv>1            ⍝ New, improved call sites
     pv←1+D Raze(cs/⍳⍴cs)+¨⍳¨msg   ⍝ :GO list is AFTER the call site
     ast[cs/⍳⍴cs;astImplicitResult]←1+cs/⍳⍴cs ⍝ Set up chain heads
     astr[;astparms]←ER0 pv+1      ⍝ Chain outputs together
     astr[(D Raze(-msg)↑¨1)/⍳+/msg;astparms]←NULL ⍝ End each chain
     ast[pv;]←astr
 :EndIf
 r←ast
