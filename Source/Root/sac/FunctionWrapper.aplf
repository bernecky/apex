 r←fns FunctionWrapper ast;hd;fn;fd
 ⍝ Generate fn header for defined fn
 fn←D ast[dfnname;asttarget] ⍝ Defined fn name
 fd fns ast←fns FnDefn ast
 :If #.globals.TargetLanguage≡'sisal'
     hd←'function ',fd,NL
     r←(E hd),E'end function % ',fn,NL
 :ElseIf #.globals.TargetLanguage≡'sac'
     r←(E fd),E'}',NL,NL
 :EndIf
 r←(E r),E ast
