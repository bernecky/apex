 r←ExpandLFNs csd;cv;i;j;ast;wl;k;n;rj
 ⍝ Add a row to ast for each local fn
 ⍝ invocation. This gives a place to
 ⍝ store lfn morphology by invocation.
 ast←D csd[ssaast]
 wl←D csd[ssacv]
 r←y
 cv←ast[;astclass]∊astclassLFN
 ⍝ Ignore temps
 j←dfainit ast
 cv←cv∧j\(j⍳1)>D j⌿ast[;asttarget]
 :If 1∊cv ⍝ Any work?
     j←ast[;astlop,astfn,astrop]
     i←j∊ER0 cv/⍳⍴cv ⍝ Mark invocations
     k←D(,i)/,j
     :If 0≠⍴k ⍝ Any work?
         n←ast[k;] ⍝ New ast rows
         n[;asttarget]←k←ER0(1↑⍴ast)+⍳⍴k
         n[;astclass]←astclassVARB ⍝ Now nice varbs
  ⍝ Renumber lfn calls
         rj←⍴j ⋄ j←,j ⋄ i←,i ⋄ j[i/⍳⍴i]←k
         ast[;astlop,astfn,astrop]←rj⍴j
         ast←ast⍪n ⍝ local fns now inlined
         wl←wl∨∨/i ⍝ Inlined calls performed here
         ∘
         wl←wl,(1↑⍴n)⍴1 ⍝ New work to do
     :EndIf
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
