 r←LocalizeSysVars src;sysv;cv;hdr;j;assgn
⍝ This is horrible, but...
⍝ If this is main.wif, localize all system vars, and
⍝ give them default values.
 r←src
 :If (1∊'←main'⍷src[0;]) ⍝ Yes, this is a heuristic. Ugly ugly
     cv←~1∊¨systemvars⍷¨E src[0;] ⍝ Ignore those already localized
     sysv←,D Raze';',¨cv/systemvars
     hdr←(dtb src[0;]),sysv ⍝ New fn header
     assgn←'⎕io←0',NL,'⎕ct←1E¯13',NL,'⎕pp←10',NL
     assgn←assgn,'⎕pw←80',NL,'⎕rl←16807'
     r←NL,hdr,NL,assgn,DMTOV 1 0↓src
     r←vtom r
 :EndIf
