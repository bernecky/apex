 fsm lineno
 ⍝ Interpret one state rule
 :If signal=clsrescan  ⍝ Rescan for (exp)foo ⍵, etc.
     signal←D stk[stkp;Stkstate]
 :Else
     signal←tok[c]
     stk[stkp;Stkstate]←E signal
 :EndIf
 :If #.apexutils.isTrace 'syn'
     src see tok
 :EndIf
 'Compiler bug'assert(0=⍴⍴state)∧0=⍴⍴signal
 :Select signal
 :Case clsspace       ⍝ Ignore white space left of anything
     PushCursor c gett(E src),E tok ⍝ push cursor past white space
 :Case clsassign      ⍝ Assignment arrow left of something
     ast2assign
 :Case clslbr         ⍝ Left bracket left of something
     ast2lbr
 :Case clsrbr         ⍝ Right bracket left of something
     ast2rbr
 :Case clslamp        ⍝ Comment left of new statement, or
     :If state≠Stn    ⍝ syntax error
         snerr
     :EndIf
     PushCursor c gett(E src),E tok ⍝ Skip comment; same state
 :Case clsconj        ⍝ Conjunction left of something
     ast2conj
 :Case clsfn          ⍝ Primitive fn left of something
     ast2fn
 :Case clsgoto        ⍝ Branch arrow left of something
     ast2goto
 :Case clsid          ⍝ Identifier left of something
     ast2id
 :Case clssemic       ⍝ Semicolon left of something
     ast2semic
 :Case clscolon       ⍝ Colon left of something
     ast2colon
 :Case clsadverb      ⍝ Adverb (monadic op) left of something
     ast2adverb
 :CaseList clsnum,clschar ⍝ Constant left of something
     ast2constant
 :Case clslpar        ⍝ Left parenthesis left of something
     ast2lpar
 :Case clsrpar        ⍝ Right parenthesis left of something
     ast2rpar
 :Case clsqq          ⍝ ⎕ or ⍞  left of something
     ast2qq
 :Case clssep         ⍝ Diamond (stmt separator) left of something
     snerr               ⍝ nonce error
 :Case clsctl         ⍝ Control structure keyword left of something
     ast2ctl
 :Case clsexpn        ⍝ Expression left of something
     ast2expn
 :Case clsqdnm        ⍝ System fn or system verb left of something
     ast2qdnm
 :Case clsNilFn       ⍝ Niladic fn left of something
     ast2NilFn
 :Else                ⍝ Syntax error or syntax analyzer bug
     snerr
 :EndSelect
