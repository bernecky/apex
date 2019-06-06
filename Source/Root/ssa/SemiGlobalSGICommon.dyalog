 r←ast SemiGlobalSGICommon cvsg;cv;sg;msg;astr;tar;n;rv;pv
⍝ This actually decorates the ast with the global-in
⍝ annotations. The arguments are:
⍝  - sg:  the list of lists of semi-global names.
⍝  - ast: the ast to be decorated. This is the
⍝         function that calls the functions whose
⍝         semi-globals are being added
⍝  - cv: the ast compression vector marking the defined,
⍝        derived, or primitive functions being decorated.
⍝
⍝ The :GI lines go BEFORE the subfn invocation, so that ssa
⍝ doesn't think that an associated SGO came BEFORE here.
⍝ The subfn invocation includes a pointer to the :GI
⍝
 cv←D cvsg[0]
 sg←D cvsg[1]
⍝
 msg←D 0⊃¨⍴¨sg ⍝ # semiglobals per call
 :If (1∊cv) ⍝ Any work?
     astr←astNewRows+/msg ⍝ Total new rows
     astr[;astfn]←E':GI' ⍝ Semi-globals in
     astr[;asttarget]←NULL
     tar←ast[;asttarget]⍳D Raze⍉sg ⍝ Parameters
     astr[;astrarg]←ER0 tar
     n←(⍳1↑⍴ast)++\cv\msg ⍝ New row numbers
     ast←n RenumberAst ast
     rv←1+cv\msg ⍝ Replication vector for ast
     ast←rv⌿ast ⍝ Insert new ast rows
     pv←rv/n≠¯1+(1↓n),1+¯1↑n ⍝ Mark fn calls old and new
     cv←(cv/⍳⍴cv)++\msg ⍝ New, improved call sites
     pv←cv-msg ⍝ First parameter in each block
     pv←(msg/pv)+D Raze⍳¨msg  ⍝ Parameter sites
     astr[;astparms]←ER0 1+pv ⍝ Chain parameters together
     astr[(D Raze(-msg)↑¨1)/⍳+/msg;astparms]←NULL ⍝ End each chain
     ast[pv;]←astr
     cv←(msg≠0)/cv
     msg←(msg≠0)/msg
     'oopsie'assert ast[cv;astparms]∊NULL
     ast[cv;astparms]←ER0 cv-msg ⍝ Ptr to parmlist head
 :EndIf
 r←ast
