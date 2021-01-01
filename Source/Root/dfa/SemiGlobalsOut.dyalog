﻿ r←ast SemiGlobalsOut y;j;k;i;astsub;tar;m;t;astr;cv
⍝ Update ast with semiglobal
⍝ results from the fn called at ast[i;]
⍝ Result is (E new ast),E new wl
 i←D y[0]
 astsub←D y[1] ⍝ subfn ast
 r←(E ast),E(1↑⍴ast)⍴0 ⍝ No work result yet
 :If (~i≡NULL)∧~0∊⍴i   ⍝ No SG out
     j←+/∧\((i+1)↓ast[;astfn])∊E':GO' ⍝ Semiglobals out follow
     :If j≠0
  ⍝ the invocation and are all adjacent.
         k←ast[1+i+⍳j;] ⍝ The pointers we need
         'We are confused'assert∧/i=D k[;astrarg]
         tar←D k[;asttarget]
         t←UnSSAName¨ast[tar;asttarget] ⍝ Semiglobal names
  ⍝ Now find semiglobal names in subfn.
  ⍝ Use SSA Names from last block of cfg
         m←(cv←astsub[;astfn]∊E':RI')⌿astsub[;asttarget]
         :If ×⍴m            ⍝ Stupid APL2 prototypes
             m←(UnSSAName¨astsub[D m;asttarget])⍳t
             m←(cv/⍳⍴cv)[m] ⍝ Now have SSA names for SGO rows.
             m←astsub[m;] ⍝ Semiglobal rows in subfn
             astr←ast[tar;] ⍝ ast rows to be updated
             astr[;astchar]←m[;astchar]
             TRACEdfa Trace 'Semiglobals out from: ',(D astsub[0;asttarget]),' to: ',D ast[0;asttarget]
             TRACEdfa Trace 'ast[tar;]:'
             TRACEdfa Trace  ast[tar;]
             TRACEdfa Trace 'astr:'
             TRACEdfa Trace  astr
             astr←astr[⍋tar;] ⍝ Make sure these are in order!
             r←astmerge(E ast),(E astr),E(⍳1↑⍴ast)∊tar
         :EndIf
     :EndIf
 :EndIf
