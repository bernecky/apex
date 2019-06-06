﻿ r←BuildComment txt
⍝ Build comment from txt
 :Select TargetLanguage
 :Case 'sac'
     r←'/* ',txt,' */'
 :Case 'sisal'
     r←'# ',txt
 :Case 'plural'
     r←'/* ',txt,' */'
 :Else
     ⎕←'No BuildComment for TargetLanguage: ',TargetLanguage
     ÷0
 :EndSelect
