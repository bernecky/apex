 InvokeDyadicFn;i;astr;lf;fn;ro;op;row
 ⍝ Call function dyadically.
 :If (D stk[stkp-3;Stktokcl])∊clsadverb
     InvokeDyadicAdverb
 :ElseIf (D stk[stkp-3;Stktokcl])∊clsconj
     InvokeDyadicConjunction
 :Else ⍝ Vanilla dyadic fn
     ⍝ Case 1:  X foo strand
     :If 2 isStrand stk
         nms←')'StrandItems 3
         subfn←D(1,Stkvalue)⌷2 StackCopy stk ⍝ subfn1 or ⊢
       ⍝ Sheep vs goats. Skip destranding if subfn is primitive.
         :If isnum subfn
             subfn←D ast[subfn;dfnname]
             (ast astr stk)←nms BuildStrandAssigns(ast 0 'i'stk subfn)
             stke←StackPop 4+⍴nms ⍝ Pop larg, fn, rarg, paren, and nms
             stke[1;Stkstate]←Stx ⍝ No longer a strand
             stk←stk StackPush stke[(⍳2),1+⍴nms;] ⍝ Push larg, fn, dummy arg
             ast←ast append2Ast astr
             InvokeDyadicFn ⍝ Recurse to emit vanilla fncall
         :Else ⍝ (⊢  strand) or (⊣  strand)
             ('Verb ',subfn,' does not support strands')assert subfn∊'⊢,⊣'
             j←StackPop 1÷0 ⍝ Pop the verb; it is an identity
             state←Stx ⍝ State is expression again
         :EndIf
     :Else
     ⍝ Case 2: X foo y
         lf←StackPop 1 ⍝Pop larg
         fn←StackPop 1 ⍝ Pop function
         astr←,astNewRows 1
         row←≢ast
         astr[asttarget]←E row
         astr[astlarg]←lf[0;1]
         astr[astfn]←fn[0;Stkvalue]
         astr[astrarg]←(StackPop 1)[0;Stkvalue] ⍝ Right argument
         astr[astclass]←astclassVARB
         ast←ast append2Ast astr
         stk[stkp;]←(E Stx),(E row),E'x'
         state←Stx
         stkp←stkp+1
     :EndIf
 :EndIf
