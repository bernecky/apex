 r←astNops ast;nops;p
 ⍝ ast entries that don't generate any code
 nops←NULL,(E,';'),(E':For'),(E':EndFor'),(E':While'),(E':EndWhile')
 nops←nops,(E':If'),(E':EndIf'),(E':PHI'),(E':GI'),(E':GO')
 nops←nops,(E':PA'),(E':RE')
 r←(~dfainit ast)∨ast[;astfn]∊nops
 ⍝ Now handle fns that refer to :PA entries, which was a dumb idea...
 p←(ast[;astfn]∊E':PA')/⍳1↑⍴ast
 r←r∨∨/ast[;astptrs]∊p
