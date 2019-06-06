 r←BuildComment txt
⍝ Build comment from txt
 :If TargetLanguage≡'sac'
     r←'/* ',txt,' */'
 :EndIf
 :If TargetLanguage≡'sisal'
     r←'# ',txt
 :EndIf
