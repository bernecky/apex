﻿ r←ast QuoteQuadInputKludge2 astr;row
 ⍝ If we have '←...⍞', generate single token
 r←astr
 :If astr[astfn,astrarg]≡(E,'←'),E'⍞'
     ⍝ We have to generate a temp here, because astmerge
     ⍝ wants "flattened" code.
     r←(2,⍴astr)⍴astr
     r[0;astfn]←E'←⍞'
     r[0;astrarg]←NULL
     row←≢ast
     r[0;asttarget]←row
     r[1;astfn]←E,'←'
     r[1;astrarg]←row
     r[;asttype]←E asttypeC
     r[;astrank]←E 1
 :EndIf
