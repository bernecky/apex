 snaV;i;j;astr;p
 ⍝ Assign name to a naked verb.
 ⍝ No change in state, side effect only.
 i←(c-1)gett(E src),E tok
 j←(stkp-1)⌷stk ⍝ Source for assign
 astr←,astNewRows 1
 astr[asttarget]←i[GettValue]
 p←ast[D i[GettValue];astclass]∊astclassVARB,NULL,j[Stktokcl]
 'Source program syntax error: id class change'assert p
 ⍝ Class can only change from unknown or varb to fixed value.
 ast[D i[GettValue];astclass]←j[Stktokcl] ⍝ Now fixed.
 astr[astfn]←E Copy
 astr[astrarg]←j[Stkvalue]
 astr[astclass]←j[Stktokcl]
 PushCursor i
 :If !(D j[Stkvalue])∊¯1+≢ast
     ast← ast append2Ast astr
 :Else
  ⍝ Replace temp w/id; set ast class
     i←D j[Stkvalue] ⍝ Target ast row
     ast[i;asttarget]←k ⍝ Replace temp w/id
     'Source program syntax error: id class change'assert ast[i;astclass]∊NULL,j[Stktokcl]
     ast[i;astclass]←j[Stktokcl]
 :EndIf
 c←c-1 ⍝ 2005-06-09 Can we get rid of lpn?
