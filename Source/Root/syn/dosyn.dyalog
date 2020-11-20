﻿ r←fldr dosyn y;f;gst;tn;asts;src;tok;wif
 ⍝ Perform syntax analysis for the function files named in y.
 ⍝ Result is asts
 ⎕←(fts ⎕TS),': Starting syntax analysis for: ',fldr
 src←GetFn¨,¨y  ⍝ Get all source code
 src←LocalizeSysVars¨src           ⍝ Undo APL design errors
 src←(E y)Dfn2Trad¨src             ⍝ Convert any Dfns to Tradfns
 src←D,/src                        ⍝ Flatten new subfns into src list
 src←UnDiamondize¨src              ⍝ Remove diamond statement separators
 SaveTradFns(src fldr)             ⍝ Just for debugging Dfn2Trad
 tok←tokenize¨src                  ⍝ tokenize it
 src←src QuadnameLC¨tok            ⍝ Undo Dyalog/APL*Linux spelling errors
 tok←src QuadnameNiladicKludge¨tok ⍝ Undo more APL design errors
 f←(E¨src),¨E¨tok
 ⍝ Get class and valence of all source fns
 InitializeAST
 gst←D buildgst¨f
 asts←(E(E gst),E f)sntx¨⍳⍴f ⍝ Invoke syntax analyzer
 asts←ComposeKludge¨asts  ⍝ Fix conj/adv rop vs rarg
 asts←AddPA¨asts          ⍝ Add ast rows for conj/adv operands
 Checkem¨asts             ⍝ Paranoia check
 r←asts
 ⎕←(fts ⎕TS),': Syntax analysis complete for: ',fldr
