 snil;k;idcls
 ⍝ identifier left of index list
 k←stk[stkp-2;Stkstate] ⍝ ref vs assign
 PushCursor Push state
 ⍝ The id may legally be variable or niladic function
 idcls←D ast[D stk[stkp-1;Stkvalue];astclass]
 :If (k=Sta)∧idcls=astclassVARB    ⍝ Indexed assign
     doindexass
     stk[stkp;Stkstate]←E clsexpn
 :ElseIf idcls=astclassVARB        ⍝ Indexed reference of variable
     snxl
 :ElseIf idcls=astclassNFN         ⍝ Indexed reference of niladic fn
     InvokeNiladicFn state         ⍝ Emit niladic fn call
     snxl
 :Else
     snerr
 :EndIf
