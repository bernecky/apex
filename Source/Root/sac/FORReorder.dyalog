 r←ast FORReorder phiomega;b;e;nd;cv;i;j;bi;ei
⍝ Reorder phiomega entries to match nesting level
⍝ of :For loops.
 b←ast[;astfn]∊E':For'
 e←ast[;astfn]∊E':EndFor'
 nd←+\b+¯1×e ⍝ Nesting depth
 cv←nd+e ⍝ Match begins and ends
 bi←b\⍳+/b
 ei←e\⍳+/e
 r←(⍴phiomega)⍴E ¯666 ⍝ merely allocating space
 :For i :In ⌽1+⍳⌈/cv
     j←cv=i ⍝ Pick out highest sets
     r[(j∧b)/bi]←phiomega[(j∧e)/ei]
 :EndFor
