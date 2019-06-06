﻿ r←EmitFnCallsIndexDirect y;mil;ast;si;refs;k;sis;m;lhs;rhs;com;mt;m2
⍝# Generate index ref ops that don't require a loop
⍝# These are those where all indices are scalar, and
⍝# where NULLs only appear in trailing axes
⍝# These will gen X[[i,j]], with
⍝# suitable error checks on the ⎕io-corrected indices
 mil←D y[1]
 ast←D y[2]
 refs←D(E ast)IndexAstLarg¨mil
 si←0=D ast[0⌈refs;astrank]     ⍝ Ops w/all-scalar indices,
⍝                                optionally followed by NULLs
 mt←refs∊NULL,0                 ⍝ Empty or non-existent axes
 k←∧/(∧\si)∨(~∧\si)∧mt
 m←k⌿D mil                        ⍝ This fn generates these entries
 sis←,D(E ast)TargetName¨m
 mt←k⌿D mt
 sis[(,mt)/⍳⍴sis]←E''           ⍝ Elided axes
 sis←','InsertInterAxisCommas(⍴mt)⍴sis
 lhs←mcb ast TargetName ast FindReferent(i\k)⌿ast[;astlarg]
 m2←~∧/mt                        ⍝ Non-empty indices need brackets
 lhs←lhs,((E''),E'[[')[m2]
 rhs←((E''),E']]')[m2]
 sis←Raze⍉lhs,(mcb sis),rhs
 r←(E k),E sis                   ⍝ k is the items we can handle
