 ast2qq;i;fn
⍝ quad, quote-quad
 :Select state
 :CaseList Stn,Stf,Stl,Sto ⍝ ⍞   ⍞f⍵  ⍞[0]  ⍞/⍵
     PushCursor Push state
     InvokeNiladicFn state
     Rescan clsexpn
 :Else
     sner        ⍝ writeme
 :EndSelect
 →0
 ................

 :Select state
 :CaseList Stn,Stf,Stl,Sto ⍝ ⎕io        ⍞           ⎕wa
                           ⍝ (⎕wa f ⍵)  (⎕io f ⍵)
                           ⍝ (⍞[0])     (⎕ts[0])
                           ⍝ (⍞/⍳w)     (⎕ts/⍳7)
     i←c gett(E src),E tok
     fn←ast[D i[GettValue];asttarget]
     'Compiler bug'assert fn∊systemvars,sysQQ
     :If fn∊systemvars,systemnfns   ⍝ ⎕io, ⎕wa
         snnn
     :Else                          ⍝ ⎕fi
         ÷0                         ⍝ writeme
     :EndIf
 :Else            ⍝ Others need writing...
     snerr
 :EndSelect
