﻿ r←ConstantsSACDoubleFixD c;i;b
 ⍝ c is a double constant in APL character form, e.g., ".5 2 4.5 4."
 ⍝ Turn it into a SAC double constant.
 i←' ',squeeze c
 i[(i∊'EDd')/⍳⍴i]←'e'    ⍝ Turn 1E3 or 1D3 into 1e3
 i[(i='¯')/⍳⍴i]←'-'     ⍝ Turn 1e¯13 into 1e-13
                        ⍝ and ¯4 into -4
 i←1↓¨(i=' ')PartitionedEnclose i
 b←'.'=D(E'')⍴¨i
 i←((E''),E'0')[b],¨i   ⍝ Turn .5 into 0.6
 b←i⍳¨'e'               ⍝ Turn 1e-13 into 1.0e-13
 r←(b↑¨i),¨((E'.0'),E'')['.'∊¨i],¨b↓¨i
 r←r,¨((E''),E'0')[,'.'=¯1↑¨r] ⍝ Turn 24 into 24.0
 r←¯2↓D Raze r,¨E', '
