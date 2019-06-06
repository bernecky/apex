 snin;i;j;k;newstate
 ⍝ Identifier left of start of stmt
 i←c gett(E src),E tok ⍝ SOS, Identifier
 j←D i[GettValue]
 'Probably syntax analyzer bug'assert(1↑⍴st)≠j
 ⍝ New state depends on token type
 ⍝ The following check should be done everywhere,
 ⍝ but let's see if this gets us by for now. 1995-10-28
 k←astclassnFN,astclassNFN,astclassVARB
 k←k,astclassLFN,astclassCC,astclassNC,astclassMFN,astclassDFN,NULL
 k←k⍳ast[j;astclass]
 newstate←(Stf,StN,Stx,StV,Stx,Stx,StV,StV,Stx)[k]
 ⍝ Undef treated as variable!
 PushCursor i Push newstate
