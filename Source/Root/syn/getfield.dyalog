 r←getfield y;i
 ⍝ Extract leading field from matrix y. The field starts at col 1 and
 ⍝ extends to the first blank, but doesn't include the blank.
 i←∧\y≠' '
 r←⌈/+/i ⍝ Longest name.
 i←r takeR1 i
 r←(⍴i)⍴(,i)\(,i)/,r takeR1 y
