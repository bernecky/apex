﻿ newsignal←PopParenthesis;sz;sbp
 ⍝ State is function. Signal is usually left parenthesis.
 sz←1+')'StackMatchBracket 0 ⍝ Pop everything up to, and including the )
 sbp←StackPop sz ⍝ Stuff between parens
 'We ARE confused'assert sbp[sz-1;Stkvalue]∊E,')'
 stk←stk StackPush⊖¯1 0↓sbp       ⍝ Push everything but the ) back on the stack
 state←sbp[sz-1;Stkstate] ⍝ Restore state outside parentheses
 newsignal←GetTokenClass sbp[0;]
 Rescan newsignal
 PushCursor c gett(E src),E tok
