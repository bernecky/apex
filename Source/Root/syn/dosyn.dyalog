 r←dosyn y;f;gst;if1;tn;asts;src;tok;wkfl;wif
 ⍝ Perform syntax analysis for the function files named in y.
 ⍝ Resulting workfile is named wkfl
 ⍝ The result is IF1 code.
 wkfl←WorkFile D y[0]
 ⎕←(fts ⎕TS),': Starting syntax analysis for: ',wkfl
 tn←qcre8 wkfl
 fdrop tn,-/2↑fsize tn
 1000000000 fresize tn
 src←GetFn¨,¨y  ⍝ Get all source code
 src←QuadKludge¨src                ⍝ Undo APL design errors
 src←(E y)Dfn2Trad¨src             ⍝ Convert any Dfns to Tradfns
 src←D,/src                        ⍝ Flatten new subfns into src list
 src←UnDiamondize¨src              ⍝ Remove diamond statement separators
 SaveTradFns(src wkfl)             ⍝ Just for debugging Dfn2Trad
 tok←tokenize¨src                  ⍝ tokenize it
 src←src QuadnameLC¨tok            ⍝ Undo Dyalog/APL*Linux spelling errors
 tok←src QuadnameNiladicKludge¨tok ⍝ Undo more APL design errors
 f←(E¨src),¨E¨tok
 ⍝ Get class and valence of all source fns
 initializeAST
 gst←D buildgst¨f
 asts←(E(E gst),E f)sntx¨⍳⍴f ⍝ Invoke syntax analyzer
 asts←ComposeKludge¨asts  ⍝ Fix conj/adv rop vs rarg
 asts←AddPA¨asts          ⍝ Add ast rows for conj/adv operands
 Checkem¨asts             ⍝ Paranoia check
 if1←tn emitast¨asts
 ⎕←(fts ⎕TS),': Syntax analysis complete for: ',wkfl
