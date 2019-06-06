 r←APLHeader ast;res;larg;fn;rarg;lcls;p;ptrs;gbls;vars;cv
⍝# Generate APL fn header from ast. Generate globals list, too
 res←D ast[dfnres;asttarget]
 r←res,(×⍴res)/'←'
 larg←D ast[dfnlarg;asttarget]
 larg←(~larg≡,'-')/larg,' '
 r←r,larg
 fn←D ast[dfnname;asttarget]
 r←r,fn,(×⍴fn)/' '
 rarg←D ast[dfnrarg;asttarget]
 rarg←(~rarg≡,'-')⌿rarg
 r←r,rarg
 p←~dfainit ast                   ⍝ Mark potential locals
 p[¯1+p⍳0]←0                      ⍝ Ignore END marker and fixed hdr
 p[dfnres,dfnlarg,dfnname,dfnrarg]←0
 lcls←p∧(ast[;astscope]=astscopeL)∧ast[;astclass]=astclassVARB
 ptrs←(astptrs≠asttag)/astptrs     ⍝ Locals must be ref'd
 lcls←lcls∧(lcls×⍳⍴lcls)∊ast[;ptrs]
 lcls←';',¨lcls/ast[;asttarget]
 cv←1∊¨lcls∊¨'?'
 :If 1∊cv
     ⎕←'WARNING! Undefined vars in locals!'
     ⎕←cv/lcls
 :EndIf
 lcls←D Raze lcls
 r←r,lcls,NL
 gbls←p∧(ast[;astscope]≠astscopeL)∧ast[;astclass]=astclassVARB
 gbls←D Raze';',¨gbls/ast[;asttarget]
 r←r,(×⍴gbls)/'⍝ GLOBALS: ',gbls,NL
