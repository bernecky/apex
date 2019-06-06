 r←ast AddArgcArgv fd
 ⍝ Fix parameter list for main()
 r←fd
 :If isMain ast
     :Select TargetLanguage
     :Case 'plural'
         r←r,' string[] args'
     :Case 'sisal'
     :Case 'sac'
     :EndSelect

 :EndIf
