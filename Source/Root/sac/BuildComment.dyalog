 r←BuildComment txt
⍝ Build comment from txt
 :If #.globals.TargetLanguage≡'sac'
     r←'/* ',txt,' */'
 :EndIf
 :If #.globals.TargetLanguage≡'sisal'
     r←'# ',txt
 :EndIf
