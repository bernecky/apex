﻿ r←IsCaseReduceQUICKSTOP fns;qsb;b;cv
⍝# Mark reductions that can quick-stop
 cv←fns[;fnsfn]∊(E'sl'),E,'sl1'
 qsb←(E'mpy'),(E'and'),(E'or'),(E'min'),E'max' ⍝ Quick-stop Boolean
 b←fns[;fnslop]∊E'mpy'                ⍝ Quick-stop Bool,Int,Double
 b←cv∧b∨(fns[;fnslop]∊qsb)∧(D fns[;fnstypes])[;fnstypesz]∊'B'
 r←fns
 r[b/⍳⍴b;fnsspec]←E'QUICKSTOP'
