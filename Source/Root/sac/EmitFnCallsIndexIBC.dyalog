﻿ r←fn EmitFnCallsIndexIBC y;X;I;m;mil;ck;k;fnc;dmil;p;i;axs
⍝# Emit code for I part of indexed reference
⍝# X[I]←Y
 X←D y[0]
 I←D y[1]
⍝⍝⍝m←  D y[2]                     ⍝ Index right-to-left axes
 mil←D y[2]
 i←D y[3]
 dmil←D(E ast)IndexAstLarg¨mil
 m←dmil>0                          ⍝ Non-null axes
 ck←,ast TargetName D(E ast)IndexList¨(i/⍳⍴i),¨astrarg
 ck[(,~m)/⍳⍴ck]←E''                ⍝ Trailing and elided axes
 ck←'),'InsertInterAxisCommas⌽(⍴m)⍴ck
 fnc←(E fn),¨(E'('),(0 ¯1+⍴m)⍴E'fr('
 axs←(0 1↓⍕¨m×(⍴m)⍴⍳¯1↑⍴m),¨E','
 fnc←,fnc,¨(E''),axs
 k←m                               ⍝ Kill null or unused axes
 k[;0]←k[;0]∨∧/~k
 fnc[(,~k)/⍳⍴fnc]←E''
 fnc←(⍴m)⍴fnc
 fnc←fnc,(mcb X),mcb(,0≠+/⍴¨ck)⍴¨E',' ⍝ Skip comma if X[;;]←Y
 r←squeeze¨fnc,ck,E')'
