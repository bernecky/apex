﻿ r←cv APLFormatPrimitive ast;p
⍝# Simple APL primitives, ctl structs, etc.
 p←~(cv⌿ast[;astlarg])∊NULL  ⍝ Dyadic fns
 r←((cv\p)⌿ast)TargetName(cv\p)⌿ast[;astlarg]
 r←r,¨((,D×⍴¨r)⍴' '),¨cv/ast[;astfn]
 r←r,¨' ',¨(cv⌿ast)TargetName cv⌿ast[;astrarg]
