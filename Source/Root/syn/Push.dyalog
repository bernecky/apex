﻿ r←{gettentry}Push newstate
⍝ Push current state, token value. & token class onto stack; set new state
⍝ gettentry is token value, token class
 :If 0=⎕NC'gettentry'
     gettentry←c gett(E src),E tok
 :EndIf
 'rbe is confused'assert(3=¯1↑⍴gettentry)∧(newstate∊states)∧state∊states
 'rbe is even confuseder'assert gettentry[GettClass]∊classes
 stkpush(E state),gettentry[GettValue,GettClass]
 state←newstate
 r←gettentry
