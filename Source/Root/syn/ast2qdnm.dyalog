﻿ ast2qdnm;i;newstate;nm
⍝ System function or variable left of anything
⍝ Does not include ⎕ or ⍞
 i←c gett(E src),E tok ⍝ Get purported quadname
 nm←i[3] ⍝ Chicken. See gett
⍝ Next line for ⎕ct, ⎕io, ⎕pp, ⎕pp, ⎕pw, ⎕rl, ⎕ts, ⎕wa, ⎕av, ⎕ts
⍝⍝⍝ :If nm∊systemnfns      ⍝ ⎕ts, ⎕av
⍝⍝⍝     ast2fn              ⍝ Treat as primitive fn
⍝⍝⍝ :EndIf
 :If nm∊systemvars,systemconsts
     :Select state
     :Case Stf          ⍝ System variable left of fn
         snif
     :Case Sto          ⍝ System variable left of adverb
         PushCursor Push Stf ⍝ Now function-ish
     :Case Stx          ⍝ System varb left of expression
         ..  ⍝⍝ Invalid unless conjunction -- f rank ⎕io (4)
     :Case Stn          ⍝ Bos treat system varb like any variable
         snin
     :Case Stl          ⍝ System varb/nfn left of left bracket: ⎕fd[⍵]???
         snil           ⍝ Treat as id left of left bracket
     :Else              ⍝ More coding needed...
         snerr
     :EndSelect
 :ElseIf nm∊systemfns,systemnfns,systemvars  ⍝ ⎕fd, ⎕nl, ⎕wa, ⎕ts, ⎕av, ⎕io
     :Select state
     :Case Stn          ⍝ Systemfn left of bos
         newstate←(StV,StN)[nm∊systemnfns,systemvars] ⍝ ⎕ts ⎕io
         PushCursor i Push newstate   ⍝ past systemfn
     :Case Stf ⍝ Systemfn left of function
         snif     ⍝ Treat like id left of function
     :Case Stl ⍝ Systemfn left of left bracket
         snil     ⍝ Treat like id left of left bracket
     :Case Stx ⍝ Systemfn left of expression
         ast2fn
     :EndSelect
 :Else
     snerr  ⍝ More coding needed
 :EndIf
