﻿ r←ast GenDefns cv;tp;rk;k
⍝ Generate parameter defns for cv⌿ast
⍝ E.g., "double[.]" for real vector.
 k←(cv⌿ast)[;astlarg,astrarg]
 tp←ast[0⌈k;,asttype],(cv⌿ast)[;,asttype]
 rk←ast[0⌈k;,astrank],(cv⌿ast)[;,astrank]
 r←⍉tp TypeRank rk
