﻿ r←KillQUADctInCalls cds;ast;cv;ltyp;rtyp;typ;parms;qcti;ndx;p
⍝# Remove spurious ⎕ct references from primitive fn calls
 ast←D cds[ssaast]
 cv←~ast[;astparms]∊NULL           ⍝ Calls w/potential sysvars
 cv←cv∧~ast[;astfn]∊E':GI'
 parms←(E ast)ParmList¨cv⌿ast[;astparms]
 qcti←(UnSSAName¨ast[;asttarget])∊E'⎕ct'⍝ incarnations of ⎕ct
 qcti←qcti/⍳⍴qcti
 cv←cv\1∊¨parms∊¨E qcti            ⍝ These entries refer to ⎕ct
 :If ∨/cv
     cv←cv∧~astfn isDefinedFn ast  ⍝ Leave defined fns until later
     ndx←D cv⌿ast[;astlarg]        ⍝ Left arg may be elided
     rtyp←ast[D cv⌿ast[;astrarg];,asttype]
     p←~ndx∊NULL                   ⍝ Stupid APL2 prototypes
     ltyp←(⍴rtyp)⍴asttypeB         ⍝ Elided entries
     ltyp[p/⍳⍴p;]←ast[D p/ndx;,asttype]
     typ←∨/(ltyp,rtyp)∊asttypeD    ⍝ These entries need ⎕ct
     cv←cv\~typ                    ⍝ These entries don't need ⎕ct
     ast←((E cv),E,E'⎕ct')SGIRemoveSSAAll ast
 :EndIf
 r←cds
 r[ssaast]←E ast
