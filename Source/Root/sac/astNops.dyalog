﻿ r←astNops ast;nops;p
 ⍝ ast entries that don't generate any code
 nops←NULL,(E,';'),(E':for'),(E':endfor'),(E':while'),(E':endwhile')
 nops←nops,(E':if'),(E':endif')
 nops←nops,(E':PHI'),(E':GI'),(E':GO'),(E':PA'),(E':RE')
 r←(~dfainit ast)∨ast[;astfn]∊nops
 ⍝ Now handle fns that refer to :PA entries, which was a dumb idea...
 p←(ast[;astfn]∊E':PA')/⍳1↑⍴ast
 r←r∨∨/ast[;astptrs]∊p
