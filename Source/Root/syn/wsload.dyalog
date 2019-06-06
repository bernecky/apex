 wsload y;load
 :If phasepause≡'no'
     ⎕LOAD y
 :EndIf
 ⎕←')load ',y,'?'
 load←''⍴⍞
 :If 'y'=load
     ⎕LOAD y
 :EndIf
