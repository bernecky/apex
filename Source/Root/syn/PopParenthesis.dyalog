 PopParenthesis;i;j;sz;newsignal
 ⍝ State is function. Signal is left parenthesis.
 sz←1+')'StackCheck⍳stkp ⍝ Pop everything up to, and including the )
 j←stkpop sz
 'We ARE confused'assert j[sz-1;Stkvalue]∊E,')'
 stkpush⊖¯1 0↓j       ⍝ Push everything but the ) back on the stack
 state←j[sz-1;Stkstate] ⍝ Restore state outside parentheses
 newsignal←GetTokenClass j[0;]
 Rescan newsignal
