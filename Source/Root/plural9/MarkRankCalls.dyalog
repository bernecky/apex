﻿ r←MarkRankCalls ast;rop;b
⍝ Mark ast rows that are rank conjunction invocations
 r←ast[;astfn]∊E,'⍤
 rop←r/ast[;astrop]
 r←r\b←(isnum rop)∧~rop∊NULL ⍝ rop non-primitive
 r←r\ast[D b/rop;astclass]∊astclassNC ⍝ and is num constant
