﻿ r←EmitInnerProductOneCase1 sis
  ⍝ Special case1 for x f.g y
  ⍝   x[1] is a boolean selector for rows of
  ⍝   y, with (~x[i]) being an identity for g.
 / ⍝ Isn't sis a text vector? Why eachness below?
 sis←(E'$CASETRAN')MacroKill¨sis ⍝Kill
 sis←(E'$CASEQUICKSTOP0')MacroKill¨sis ⍝Kill
 sis←(E'$CASEQUICKSTOP1')MacroKill¨sis ⍝Kill
 sis←(E'$CASEBL')MacroInsert¨sis
