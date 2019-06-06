 r←benchloop n
 ⍝ Test loop speed.
 r←(⍳0)⍴⌊n ⍝ Non-declare
 n←2500×n
l:
 →(0<n←n-1)⍴l
 r←1
