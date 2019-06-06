 r←ConstantsSAC ast;cv;c;i;astb;j;tp
 ⍝ Convert APL constants to SAC format
 cv←ast[;astclass]∊astclassNC,astclassCC
 astb←ConstantsSACDouble ast
 astb←ConstantsSACCharacter astb
 astb←ConstantsSACBoolean astb
 astb←ConstantsSACInteger astb
 ⍝ Amend vector consts with descriptor.
 cv←cv∧1=D astb[;astrank] ⍝ Vector constants
 i←(cv⌿astb)[;asttarget]
 i←(E'[')catenateeach i catenateeach E']'
 j←0=D cv/astb[;astxrho] ⍝ Correct empty vectors
 tp←D(cv\j)⌿astb[;asttype]
 tp←'[',¨':',¨TypesSAC[tp],¨']'
 i[j/⍳⍴j]←tp
 astb[cv/⍳⍴cv;asttarget]←i
 r←astb
