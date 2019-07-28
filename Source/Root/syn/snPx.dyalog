 snPx;i;j;k;m;newsignal;astr;dirin;sz;lhs;rhs
 ⍝ Left parenthesis left of expression(s)
 ⍝ E.g.,
 ⍝ Got both args of dyadic fn:      (exp)+exp
 ⍝ Got superfluous parens at right: exp+(exp)
 ⍝ Got left operand of adverb/conjunction (exp)/exp
 ⍝ (+.×)/ exp
 ⍝ (exp)[exp]
 ⍝ (b c d)←omega (Strand)
 ⍝ foo (b c d)   (Strand)
 ⍝ foo (b)       (NOT a strand)
 :If 0 isStrand stk
  ⍝ (id id id) or (id n id) or ( id n (2+3)) or (omega)
  ⍝ Check for strand assign (b c)← ( d e)
     sz←')'StackMatchBracket 0
     :If (Sta=stk[stkp-1+sz;Stkstate])
     :AndIf ((3+sz)isStrand stk)
     ⍝ Build strand assigns, an sich
         lhs←(StackPop sz)[;Stkvalue]
         j←StackPop 3 ⍝ ) ←  (
     ⍝ Have to leave nmin on stack, as result of assign is rhs
         rhs←(StackCopy sz)[;Stkvalue]
         astr←astNewRows≢rhs
         astr[;asttarget]←lhs
         astr[;astrarg]←rhs
         astr[;astfn]←E Copy
         astr[;astclass]←astclassVARB
         astr[;astscope]←0
         ast←ast append2Ast astr
         ⍝ New state is rhs strand
         i←StackPop 1
         PushCursor(i[0;Stkvalue,Stktokcl],E 1)Push D StS
     :Else ⍝ Not strand assign
         PushCursor Push StS ⍝ Push paren/strand onto stack, push cursor
     :EndIf
 :Else ⍝ Not a strand. Something like (omega)+2. Just remove the parens
     i←StackPop 2 ⍝ Popped item, previous syntax state
     PushCursor(i[0;Stkvalue,Stktokcl],E 1)Push D i[1;Stkstate]
     Rescan clsexpn
 :EndIf
