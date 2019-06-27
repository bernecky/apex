 r←ast HandleDeclarations src;cv;types;ranks;arg;t;rk;tr;i;nms;j;k
 ⍝ Handle declarations in source code
 ⍝  E.g.,   ⍝ dcl type rank name
 ⍝          ⍝ dcl integer 3 mytensor  (rank-3 integer array)
 ⍝          ⍝ dcl complex vector d
 r←ast
 i←rtnb src
 cv←('⍝'=i[;0])∧(rtnb 0 1↓i)[;⍳4]∧.='dcl ' ⍝ Locate dcls
 i←rtnb 0 4↓rtnb 0 1↓rtnb cv⌿src           ⍝ Locate start of args
 :If ~0∊⍴i
     types←(E'boolean'),(E'integer'),(E'double'),(E'complex'),E'character' ⍝ Legal types
     types[D asttypeB,asttypeI,asttypeD,asttypeZ,asttypeC]←types
     ranks←(E'scalar'),(E'vector'),(E'matrix'),(E,'0'),(E,'1'),(E,'2'),E,'3'
 ⍝ Get type specifier
     t←mcb(asttypeB,asttypeI,asttypeD,asttypeZ,asttypeC)[types⍳GetField i]
     i←stnb stb i
     rk←ER0⍪ranks⍳GetField i ⍝ Get rank specifier
     nms←GetField stnb stb i ⍝ Get identifier name(s)
     :For k :In ⍳1↑⍴nms
 ⍝ Look up one set of declarations
         j←D nms[k]
         j[(j=',')/⍳⍴j]←' ' ⍝ We allow comma or blank as name delimiter
         j←eew j
         tr←ast[;asttarget]⍳j ⍝ Look 'em up
         r[tr;asttype]←t[k;]
         r[tr;astrank]←rk[k;]
         i←,rk[k;]∊E 0 ⍝ If scalar, set shape and xrho
         r[i/tr;astshape]←E⍳0
         r[i/tr;astxrho]←E 1
     :EndFor
 :EndIf
