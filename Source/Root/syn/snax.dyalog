 snax;i;j;astr;k;m;p
 ⍝ Assignment left of expression
 c←c-1                 ⍝ Push cursor past "←"
 i←c gett(E src),E tok ⍝ Get token left of arrow
 :If clsspace=D i[GettClass] ⍝ Skip white space "x   ←4"
     PushCursor i            ⍝ KLUDGE: This should be done via syntax rules...
     i←c gett(E src),E tok   ⍝ and get next token
 :EndIf
 ⍝
 :Select D i[GettClass]
 :Case clsqq               ⍝  ⎕← or ⍞← output
     snaxQuoteQuadOutput i
 :Case clsrbr              ⍝ indexed assign
     state←Sta
     PushCursor Push Stn
 :Case clsrpar             ⍝ (b c d)← omega
     state←Sta             ⍝ We want to stack b c d, eventually
     PushCursor Push Stn
 :Else                  ⍝ direct assign
   ⍝ we are trying to do vanilla assignment or ←⍞.
   ⍝ Eventually, we end up back in snaa.
     PushCursor i         ⍝ ...past identifier
     p←i[1]∊(E clsrbr),(E clsid),E clsqdnm
     'Source program syntax error: bad index expression'assert p
     j←stackent 0 ⍝ Source for assign
     astr←,astNewRows 1
     astr[asttarget]←i[GettValue]
     astr[astfn]←E Copy
     astr[astrarg]←j[1]
     astr[astclass]←astclassVARB
     astr←ast QuoteQuadInputKludge2 astr
     ast←ast append2Ast astr
 :EndSelect
