﻿ r←IsCaseReduceFOLD fns;cv
⍝# Mark reductions that can use SAC "fold" notation
 cv←fns[;fnsfn]∊(E'sl'),E'sl1'
 cv←cv∧fns[;fnslop]∊(E'plus'),(E'mpy'),(E'and'),(E'or'),(E'min'),E'max'
 r←fns
 r[cv/⍳⍴cv;fnsspec]←E'FOLD'
