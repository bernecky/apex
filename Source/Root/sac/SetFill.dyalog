 r←sis SetFill typ
⍝ Insert fill for typ
 r←GetFill Types⍳LC¨typ
 r←(E'$OTFILL')Strepl¨ER1(⍪sis),r
