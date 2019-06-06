 r←dfaWHILE y;ast;wl;i;j;k;b;n;p
 ⍝ Handle Dyalog :while loop
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E':While'
 wl←wl∧~ast[;astfn]∊E':EndWhile' ⍝ Kill ends
 wl←wl∧~i ⍝ Update worklist
 :If 1∊i ⍝ Any work?
     ÷0 ⍝ Do nothing?
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
