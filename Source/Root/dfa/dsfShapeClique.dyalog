﻿ r←i dsfShapeClique ast;rnks;args;nsa;cv;cliq
 ⍝ Handle dyadic scalar function shape cliques
 ⍝ If one arg scalar, result is in same shape clique as other arg
 ⍝ If both args nonscalar and both in same SC, result is in same SC
 args←i⌿ast[;astlarg,astrarg]
 rnks←ast[args;astrank]
 cv←∧/rnks≠NULL                  ⍝ Need both ranks known
 :If 1∊cv
     rnks←ast[args;astrank]
     cv←1=+/rnks≠0                  ⍝ One arg scalar
     nsa←</rnks≠0                   ⍝ Non-scalar rank arg
     cliq←((i\cv)/⍳⍴i),⍪cv⌿(nsa⌽args)[;0]
     ast←ast JoinShapeClique cliq
 :EndIf
 ⍝ Regardless of ranks, if both args in same SC, so is result
 cv←=/ast[args;astShapeClique]
 cliq←(⍪(i\cv)/⍳⍴i),⍪cv⌿args[;,0]
 ast←ast JoinShapeClique cliq
 r←ast
