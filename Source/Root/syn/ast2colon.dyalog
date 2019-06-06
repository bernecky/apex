﻿ ast2colon;i;p
⍝ Colon left of anything
 :Select state
 :Case Stf           ⍝ colon left of function
     InvokeMonadicFn
 :Case Std
     InvokeDyadicFn
 :Case Stx           ⍝ colon left of expression
 :Case Stn           ⍝ colon left of bos
 :Case StN           ⍝ colon left of NiladicFn   label:NiladicFn
     InvokeNiladicFn Stx
 :Else
     snerr
 :EndSelect
⍝ Push past colon. Next token must be identifier (label),
⍝ Which we also push past, without changing state.
⍝ Basically, we ignore the label:
 c←c-1                 ⍝ Skip colon
 i←c gett(E src),E tok ⍝ Label must be id
 p←clsid=i[GettClass]
 'Source program syntax error: Colon without label to its left'assert p
 PushCursor i
 'Source program syntax error: Line label not first token'assert c=¯1
 ⍝ The above fails for leading blanks, but I don't care right now,
 ⍝ because labels should not even exist...
