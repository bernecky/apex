﻿ r←PropagateAdvConjParms ast;cv;loprop;parms;b
⍝ Propagate SGI and SGO parameters/results in/out of adverb
⍝ and conjunctions.
 cv←ast[;astfn]∊ER1 mcb'.ö⍤ ⍝ All adverbs and conjunctions
 cv←cv∨IsReduceScan ast
 'already been here'assert∧/,(cv⌿ast[;astparms,astImplicitResult])∊NULL
 loprop←D cv⌿ast[;astlop,astrop]
 parms←ast[loprop;astparms]
 b←cv FilterParms parms
 parms←D b[1]
 b←D b[0]
 ast[b/⍳⍴cv;astparms]←parms
 ⍝
 parms←ast[loprop;astImplicitResult]
 b←cv FilterParms parms
 parms←D b[1]
 b←D b[0]
 ast[b/⍳⍴cv;astImplicitResult]←parms
 r←ast
