﻿ r←FileExtension TargetLanguage
 ⍝ Plural is fussy
 :Select TargetLanguage
 :Case 'plural'
     r←,'d'
 :Case 'sisal'
     r←'sis'
 :Case 'sac'
     r←'sac'
 :Else
     ⎕←'No FileExtension for TargetLanguage: ',TargetLanguage
 :EndSelect
