﻿ r←p PFATProperty fns;t;i;cv;f;fi;m;tp;j;tx;ty;val
⍝ Get primitive function property.
⍝ p is a column index into PFAT
 r←(1↑⍴fns)⍴0
 :If ~0∊⍴fns
     val←'md'['X'≠(D fns[;fnstypes])[;,0]]
 ⍝ E.g., to get compute type: PFATct PFATProperty fns
     f←DeleteCaps¨fns[;,fnsfn] ⍝ This for comaLG
     f←D¨(,val),¨Raze⍉f ⍝ Complete fn names
     fi←PFAT[;PFATfn]⍳f ⍝ Lookup
     cv←fi<1↑⍴PFAT ⍝ Ignore if not in table
     r←(PFAT[;p]⍪'?')[fi]
     :If (1∊cv)∧p∊PFATct,PFATzt
         m←cv⌿D r ⍝ Select column of interest
         r←(1↑⍴fns)⍴'?'
  ⍝ Now select based on max type(s)
         tp←D cv⌿fns[;fnstypes]
         tx←TypesBig⍳tp[;,fnstypeslarg]
         ty←TypesBig⍳tp[;,fnstypesrarg]
         j←⌈/ty,('m'≠cv⌿val)×tx ⍝ Just one type if monadic
  ⍝ If type is forced, use appropriate type
         i←m[;0]='L' ⍝ Left type?
         m[i/⍳⍴i;]←(¯1↑⍴m)/TypesBig[i⌿tx]
         i←m[;0]='R' ⍝ Right type?
         m[i/⍳⍴i;]←(¯1↑⍴m)/TypesBig[i⌿ty]
         r[cv/⍳⍴cv]←(j⌽m)[;0]
     :EndIf
 :EndIf
 r←⍪r
