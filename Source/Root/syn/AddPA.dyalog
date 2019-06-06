﻿ r←AddPA cds;ast;cv;cvl;cvr;ast1;ast2;op;m;i;b;t
⍝# Add :PA and function invocation entries for
⍝# adverbs and conjunctions on derived or defined fns.
⍝# :PA entries represent the operand for the adv/conj,
⍝# and let do DFA and code generation for the operands.
⍝ 2005-12-04 Added code to link adv/conj, via astparms,
⍝ to the new f and g entries. This will permit those
⍝ entries, to move. I think the circa-1997 code has them
⍝ bolted into fixed positions after the adv/conj, which
⍝ means that compositions of operator expressions won't work./rbe
⍝ So, the conj/adv astparms entry points to f and/or g
⍝ and the f and g entries point to the :PA entries that represent
⍝ the arguments to f and g. It is the responsibility of
⍝ dfa for the adv/conj to update the :PA entries for f and g.
 ast←D cds[ssaast]
 ast←astlop AddPAEntry ast ⍝ Add :PA entries for f
 ast←astrop AddPAEntry ast ⍝ Generate :PA entries for g
 r←cds
 r[ssaast]←E ast
 Checkem r
