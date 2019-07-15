 newsignal←PopParenthesis;sz;sbp
 ⍝ State is function. Signal is usually left parenthesis.
 sz←1+')'StackCheck⍳stkp ⍝ Pop everything up to, and including the )
 sbp←stkpop sz ⍝ Stuff between parens
 'We ARE confused'assert sbp[sz-1;Stkvalue]∊E,')'
 stkpush⊖¯1 0↓sbp       ⍝ Push everything but the ) back on the stack
 state←sbp[sz-1;Stkstate] ⍝ Restore state outside parentheses
 newsignal←GetTokenClass sbp[0;]
 Rescan newsignal
 PushCursor c gett(E src),E tok
