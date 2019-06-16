 snPx;i;j;k;m;newsignal;astr;dirin;dumy;sz
 ⍝ Left parenthesis left of expression(s)
 ⍝ E.g.,
 ⍝ Got both args of dyadic fn:      (exp)+exp
 ⍝ Got superfluous parens at right: exp+(exp)
 ⍝ Got left operand of adverb/conjunction (exp)/exp
 ⍝ (+.×)/ exp
 ⍝ (exp)[exp]
 ⍝ (b c d)←omega (Strand)

 :If stkp isStrand stk
  ⍝ (id id id) or (id n id) or ( id n (2+3))
   ⍝ This is either a strand (b c d) or we are confused.
     sz←')'StackCheck⍳stkp
     i←stk[stkp-sz;] ⍝ If we have (b c d)←omega, this is good
                   ⍝       or   omega←(b c d)
   ⍝ Build b←foo_in0 ⋄ c←foo_in1 ⋄ d←foo_in2
   ⍝ or
   ⍝       foo_out0←b ⋄ foo_out1←c ⋄ foo_out2←d
   ⍝ These vars are short-lived; they disappear during semi-global analysis
     i←stkpop sz
     dumy←i[0;]
     dirin←Sta=stk[stkp-1;Stkstate] ⍝ true for (b c d)←omega
     (ast astr)←(ast dirin)BuildStrandAssigns i
     ast←ast append2Ast astr
     i←stkpop 1 ⍝ Pop the right parenthesis
     :If 0=stkp
     ⍝ If we emptied the stack, push a dummy entry (this is probably wrong...)
         stkpush dumy
     :EndIf
 :Else ⍝ Not a strand
     i←stkpop 2      ⍝ Popped item, previous syntax state
     PushCursor(i[0;Stkvalue,Stktokcl],E 1)Push D i[1;Stkstate]
   ⍝ Index error on previous line means src pgm syntax error
     Rescan clsexpn
 :EndIf
