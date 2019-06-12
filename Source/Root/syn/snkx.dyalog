﻿ snkx;i;w;wds;v;j;astr
 ⍝ state is expression. signal is stsc kwd
 w←c gett(E src),E tok ⍝ Get the keyword
 PushCursor w
 ⍝ Make sure kwd permits expn on right.
 :Select UC D w[0]
 :Case ':IF'
     snstscif
 :Case ':WHILE'
     snwhile
 :Case ':ENDWHILE'
     ÷0 ⍝ writeme
 :Case ':IN'
   ⍝ This is a :for/:in expression.
   ⍝ Next tokens must be {:for}{ }{variablename}
     v←c gett(E src),E tok ⍝ Varb may be next
     :If clsspace=D v[1] ⍝ Push past white space
         PushCursor v
         v←c gett(E src),E tok ⍝ Now should definitely be varb
     :EndIf
     'Source program syntax error'assert(D v[1])=clsid
     PushCursor v
   ⍝ White space must be next
     i←c gett(E src),E tok
     'Source program syntax error'assert(D i[1])=clsspace
     PushCursor i ⍝ Push past white space
     i←c gett(E src),E tok ⍝ See if :for is next
     'Source program syntax error'assert':FOR'≡UC D i[0]
     PushCursor i ⍝ Push past :for
   ⍝ Need assertion on c=¯1 or only-have-label-left.
   ⍝ Emit :for expression.
     j←stkpop 1 ⍝ Pop the :in argument
     astr←,astNewRows 1 ⍝ Build ast entry
     astr[asttarget]←v[GettValue] ⍝ Induction var in :for
     astr[astfn]←i[GettValue] ⍝ :for
     astr[astrarg]←j[0;Stkvalue] ⍝ Argument to :in
  ⍝ :endfor is noise for dfa purpose
     j←(astclassVARB,NULL)[(UC D i[GettValue])≡':ENDFOR']
     astr[astclass]←j
     Append2Ast astr
 :Case ':REPEAT'
     ÷0 ⍝ codeme
 :Case ':UNTIL'
     ÷0 ⍝ codeme
 :Else
     ÷0 ⍝ Under construction or snerr
 :EndSelect
