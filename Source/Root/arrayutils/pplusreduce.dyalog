﻿ result←boolean pplusreduce array;t;f
 ⍝ partitioned +/array.  each 1 in <boolean> designates the beginning of a part.  ⎕io-independent.
 ⍝ (sauce/pplusreduce.1 from the sharp apl utility library)
 f←1↑boolean
 boolean[0]←1
 t←(1⌽boolean)/+\array
 result←t-((-⍴⍴t)↑¯1)↓0,t
 result←(~f)↓result
