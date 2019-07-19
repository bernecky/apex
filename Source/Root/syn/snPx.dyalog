 snPx;i;j;k;m;newsignal;astr;dirin;sz
 ⍝ Left parenthesis left of expression(s)
 ⍝ E.g.,
 ⍝ Got both args of dyadic fn:      (exp)+exp
 ⍝ Got superfluous parens at right: exp+(exp)
 ⍝ Got left operand of adverb/conjunction (exp)/exp
 ⍝ (+.×)/ exp
 ⍝ (exp)[exp]
 ⍝ (b c d)←omega (Strand)
 ⍝ foo (b c d)   (Strand)

 :If stkp isStrand stk
  ⍝ (id id id) or (id n id) or ( id n (2+3)) or (omega)
  ⍝ This is either a strand (b c...) or we are confused.
     sz←')'StackCheck⍳stkp
   ⍝ Build b←foo_in0  ⋄ c←foo_in1  ⋄ d←foo_in2
   ⍝ or
   ⍝       foo_out0←b ⋄ foo_out1←c ⋄ foo_out2←d
   ⍝ These vars are short-lived; they disappear during semi-global analysis
     i←stkpop sz+1 ⍝ Pop (b c d) and the right paren
     dirin←Sta=stk[stkp-1;Stkstate] ⍝ true for (b c d)←omega
                                    ⍝ false for omega←(b c d)
     (ast astr stk)←(ast dirin stk)BuildStrandAssigns ¯1↓i
     ast←ast append2Ast astr
     PushCursor(i[0;Stkvalue,Stktokcl],E 1)Push D i[1;Stkstate]
     Rescan clsexpn
 :Else ⍝ Not a strand. Something like (omega). Just remove the parens
     i←stkpop 2 ⍝ Popped item, previous syntax state
     PushCursor(i[0;Stkvalue,Stktokcl],E 1)Push D i[1;Stkstate]
     Rescan clsexpn
 :EndIf
