 r←Twop31Kludge c;p;kludge
 ⍝ SAC can't handle ¯2*31, so we fake it.
 r←,⍎c
 p←(r=¯2*31)/⍳⍴r
 r←⍕¨r
 kludge←E'(-2147483647-1)'
 r[p]←kludge
 r←,D Raze r,¨' '
