﻿ ast2id;id;astr;callerfn;rhs;id;lhs
⍝ Identifier left of anything
 :Select state
 :Case Stn                ⍝ Id left of strand or bos:        ⍵
     snin
 :Case Stf                ⍝ Id left of fn:         ⍵ f...
     snif
 :Case Sto                ⍝ Id left of adverb:     ⍺/⍵
     PushCursor Push Stf  ⍝ Push lop; now function-ish
 :Case Std                ⍝ Id left of dyadic fn:  x ⍺ f ⍵
     InvokeDyadicFn
 :Case StC                ⍝ Id left of naked conj: ⍺ +.×
     sniC
 :Case StA                ⍝ Id left of naked adv:  ⍺ /
     sniA
 :CaseList Stx            ⍝ Id left of expression
     snix
 :CaseList StS            ⍝ Id left of strand
     snis
 :Case Stl                ⍝ Id left of left bracket:  ⍺[...] or ⍺[...]←⍵
     snil
 :Case StN                ⍝ Id left of niladic fn: foo Niladicfn
     InvokeNiladicFn Stx
 :Case Sta                ⍝ Id left of assignment (strand)
                          ⍝ This is not for (b c d)←omega only
                          ⍝ We also get it for Z←(b c d)
                          ⍝ when Z is the function result
     id←c gett(E src),E tok ⍝ Get Z from st row index
     id←st[id[GettValue];GettValue]
     'strand not assigned to function result'assert id≡st[dfnres;GettValue]
     ⍝ For Z←( b c d), where Z is the formal function result, generate:
     ⍝ Ish - need caller fn name?
     ⍝   sgo0←b
     ⍝   sgo1←c
     ⍝   sgo2←d
     ⍝
     sz←')'StackMatchBracket 1
     rhs←Stkvalue⌷⍤1⊢(-sz)↑1 StackDrop stk
     ⍝ Z← dummy (but we use b)
     callerfn←'' ⍝ No idea of caller fn name
     (ast astr stk)←rhs BuildStrandAssigns(ast 0 'o'stk callerfn)
     ast←ast append2Ast astr
     id←StackPop sz+2 ⍝ Kill strand; Fake up Z←b
     id←id[1 0;]
     id[0 1;Stkstate]←Stn,Stx
     stk←stk StackPush id
     Push Stx
 :Else
     snerr
 :EndSelect
