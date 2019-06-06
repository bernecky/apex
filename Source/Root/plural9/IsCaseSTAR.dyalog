 r←IsCaseSTAR fns;fnsf;fnsg;g0;g1;p;xr
⍝# Mark fns w/special case to use inner product STAR algorithm f.g
 fnsf←fns                      ⍝ fns entry for f
 fnsf[;fnsfn]←fnsf[;fnslop]
 fnsf[;fnslop,fnsrop]←E''
 lid←,D PFATlid PFATProperty fnsf ⍝ Left identity for f
 r←fns
⍝ Boolean left-side only. D+.×D is faster w/TRANSPOSE
 :If 1∊(lid∊'01')∧'B'=(D fns[;fnstypes])[;fnstypeslarg]
     fnsg←fns
     fnsg[;fnsfn]←fnsg[;fnsrop]    ⍝ fns entry for g
     fnsg[;fnslop,fnsrop]←E''
     g0←,D PFATl0 PFATProperty fnsg
     g1←,D PFATl1 PFATProperty fnsg
     xr←('01'⍳lid)⌽(((mcb g0),g1),'.') ⍝ x element for speedup or '?'
     xr←xr[;0]
 ⍝ The STAR algorithm, as of 2005-11-26, won't work on rhrank>2,
 ⍝ by the way... FIXME  rbe
     p←(D fns[;fnsranks])[;fnsranksrarg]∊'012'
 ⍝ STAR algorithm doesn't help VxV, SxV, VxS cases.
     p←p∧~fns[;fnsranks]∊(E'110'),(E'010'),E'100'
     p←p∧(fns[;fnsfn]∊E'dot')∧~fns[;fnslop]∊E'jot'
     r[p/⍳⍴p;fnsspec]←E'STAR'
 :EndIf
