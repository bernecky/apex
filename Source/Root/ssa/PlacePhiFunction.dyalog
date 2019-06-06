﻿ r←y PlacePhiFunction m;hasphi;inwork;wl;ast;bb;st;w;v;cfg;dom;df;i;ww
 ⍝ Place SSA phi functions for variable m
 ⍝ Michael Wolfe P182
 ast←D y[ssaast] ⋄ bb←D y[ssabb]
 cfg←D y[ssacfg] ⋄ dom←D y[ssadom] ⋄ df←D y[ssadf]
 hasphi←(+/bb)⍴0
 r←⍳0
 wl←inwork←bb porreduce ast[;asttarget]∊m
 ⍝ Now loop until wl is empty
lp:→((⍴wl)=v←wl⍳1)⍴lz ⋄ wl[v]←0
 ⍝ for w in df(v) do...
 w←df[v;] ⍝ Current Dominance frontier
 r←r,(i←w∧~hasphi)/⍳⍴w
 wl←wl∨i∧~inwork
 inwork←inwork∨i∧~inwork
 hasphi←hasphi∨i
lp2z:→lp
lz:
