 r←src getlbls tok;i;j;k
 ⍝ Get labels in source text
 ⍝ Result is 2-element vector of vectors, one vector per label
 i←tok∊clscolon ⍝ Mark labels
 i←,k←(~i)∧⌽∨\⌽i
 k←∨/k
 j←#.arrayutils.squeeze i\i/,src
 r←(E⍕¨k/⍳⍴k),E 1↓¨PartitionedEnclose((0≠⍴j)⍴' '),j
