﻿ r←isUsesRank bm;blist;ufns;fntext
⍝ Predicate to mark a benchmark if it uses the rank conjunction,
⍝ or even hints that it does (e.g., it uses APEX-only
⍝ window-reduce with monadic left operand.).
 blist←GetFileChar bm
 ufns←ER1 vtom ¯1⌽blist,(NL≠¯1↑blist)⍴NL
 fntext←GetFileChar¨(E #.fileutils.Path bm),¨ufns
 r←∨/'⍤'∊¨fntext
