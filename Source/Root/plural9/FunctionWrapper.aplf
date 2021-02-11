 r←fns FunctionWrapper ast;hd;fn;fd
 ⍝ Generate fn header for defined fn
 fn←D ast[dfnname;asttarget] ⍝ Defined fn name
 fd fns ast←fns FnDefn ast
 :Select TargetLanguage
 :Case 'sisal'
     hd←'function ',fd,NL
     r←(E hd),E'end function % ',fn,NL
 :Case 'sac'
     r←(E fd),E'}',NL,NL
 :Case 'plural'
     r←(E fd),E'}',NL,NL
 :Else
     ⎕←'No FunctionWrapper for Target Language: ',TargetLanguage
     ÷0
 :EndSelect
 r←(E r),E ast
