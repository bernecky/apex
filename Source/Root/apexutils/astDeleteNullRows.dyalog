 r←astDeleteNullRows ast;cv
⍝ Delete Null rows from ast
⍝ We do this for two reaons:
⍝ a. It speeds up later phases of compilation
⍝ b. Certain code (e.g, FORRename) presumes that
⍝    the set of :PHI functions following a :FOR
⍝    are contiguous. 1996-04-08
 cv←~∧/ast∊NULL
 cv[¯1+⍴cv]←1 ⍝ Superstition. Can't remember why we
⍝ want a NULL as last row of ast. 1996-04-08
⍝⍝ bb dead after ssa work      bb←D cds[ssabb]
⍝⍝'Oh, bad. Basic block deleted!'assert ~∨/bb∧~cv
⍝⍝ nasts[ssabb]←E cv/bb
 r←cv⌿(¯1++\cv)RenumberAst ast
