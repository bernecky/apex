 r←cv SGIMark ast;i
⍝ Mark semiglobal-in lists at cv
⍝ This SHOULD trace the pointers from astparms
⍝ but this will work for now... 1996-04-24
 i←D cv/ast[;astparms] ⍝ Start here
 r←(⍴cv)⍴0
 r[(i≠NULL)/i]←1
 r←r pandscan ast[;astfn]∊E':GI'
