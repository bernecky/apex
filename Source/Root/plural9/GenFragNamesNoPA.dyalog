﻿ r←ast GenFragNamesNoPA fns;cv
⍝# Eliminate :PA entries and their callers
 cv←MarkPAEntries ast
 fns[cv/⍳⍴cv;]←E''
 r←fns
