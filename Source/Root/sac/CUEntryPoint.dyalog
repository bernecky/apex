﻿ r←CUEntryPoint asts
⍝# Return the entry point ("main") for the compilation unit
 r←D''⍴¯1↑asts ⍝ Last asts entry is Main"
 r←D r[ssaast]
 r←D r[dfnname;asttarget]
