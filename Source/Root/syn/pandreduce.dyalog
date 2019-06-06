 result←boolean pandreduce array;b;c
 ⍝ partitioned ∧/array; ∧/,array∊ 0 1 ←→ 1.  each 1 in <boolean> designates the beginning of a part.  ⎕io-independent.
 ⍝ (sauce/pandreduce.1 from the sharp apl utility library)
 b←,(⍴array)⍴boolean
 c←(b≥,array)/b
 result←((¯1↓⍴array),+/boolean)⍴(c/1⌽c)∧b/,array
