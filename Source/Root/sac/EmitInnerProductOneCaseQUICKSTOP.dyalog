 r←EmitInnerProductOneCaseQUICKSTOP sis;i;t
 ⍝ Generate quickstop code
 sis←(E'$CASEBL')MacroKill¨sis ⍝ Kill
 sis←(E'$CASETRAN')MacroKill¨sisp ⍝ Kill
 i←f[;0?]∊(E'or'),E'max'
 t←'$CASEQUICKSTOP','10'[i]
 sis←(E t)MacroKill¨sis ⍝Kill
 t←'$CASEQUICKSTOP','01'[i]
 sis←(E t)MacroInsert¨sis ⍝Insert it
