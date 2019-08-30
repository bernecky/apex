 snPx;i;j;k;m;newsignal;astr;dirin;sz;lhs;rhs;rhsindex;subfn
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
 :If 1 isListOfExpns stk
  ⍝ (id id id) or (id n id) or ( id n (2+3)) or (omega)
  ⍝ Case 1: strand assign (b c)← ( d e)
     sz←')'StackMatchBracket 1
     rhsindex←stkp-sz+2
     :If (Sta=stk[stkp-1+sz;Stkstate])
     :AndIf ((3+sz)isListOfExpns stk)
     ⍝ Build strand assigns, an sich
         lhs←(StackPop sz)[;Stkvalue]
         j←StackPop 3 ⍝ Pop the ") ←  ("
     ⍝ Leave rhs (result of assign) on stack
         rhs←(StackCopy sz)[;Stkvalue]
         astr←astNewRows≢rhs
         astr[;asttarget]←lhs
         astr[;astrarg]←rhs
         astr[;astfn]←E astfnCopy
         astr[;astclass]←astclassVARB
         astr[;astscope]←astscopeL
         ast←ast append2Ast astr
         ⍝ New state is rhs strand
         i←StackPop 1
         PushCursor(i[0;Stkvalue,Stktokcl],E 1)Push D StS
     :ElseIf (rhsindex≥0)
     :AndIf isFormalArg(0,Stkvalue)⌷⊖StackCopy sz+2
         ⍝ Case 2: omega, aka rhs, is formal argument of defined fn
         ⍝    ∇r←foo omega;b;c
         ⍝     (b c)←omega, and omega an argument
         'Need omega as bottom stack item'assert 0=rhsindex
         ⍝ Build assigns for semi-globals in
         lhs←Stkvalue⌷⍤1⊢StackCopy sz
         subfn←ast[dfnname;asttarget]
         (ast astr stk)←lhs BuildStrandAssigns(ast 1 'i'stk subfn)
         ast←ast append2Ast astr
         state←Stx
         j←StackPop sz+1 ⍝ Pop the lhs strand
         c←c-1 ⍝ PushCursor
     :Else
         ⍝ Something like foo( b c)
         PushCursor Push StS ⍝ Push paren/strand onto stack, push cursor
     :EndIf
 :Else ⍝ Not a strand. Something like (omega)+2. Just remove the parens
     i←StackPop 2 ⍝ Popped item, previous syntax state
     PushCursor(i[0;Stkvalue,Stktokcl],E 1)Push D i[1;Stkstate]
     Rescan clsexpn
 :EndIf
