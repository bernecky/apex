﻿ r←Tagast cds;ast
 ⍝ Tag ast rows so we can update dfa information
 ast←D cds[ssaast]
 ast[;asttag]←ER0⍳1↑⍴ast
 r←cds
 r[ssaast]←E ast
