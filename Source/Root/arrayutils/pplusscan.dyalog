 result←boolean pplusscan array;t
⍝ partitioned +\array.  each 1 in <boolean> designates
⍝ the beginning of a part.  ⎕io-independent.
⍝ (sauce/pplusscan.1 from the sharp apl utility library)
 t←boolean/+\((-1⌈⍴⍴array)↑¯1)↓0,array
 result←+\array-boolean\t-((-⍴⍴t)↑¯1)↓0,t
