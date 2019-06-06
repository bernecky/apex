 r←field1 y;i;j;k;m;p
⍝ Break on blank or tab
 i←0⌈⌈/+/j←∧\~y∊' ',TAB ⋄ m←(1↑⍴y),i
 r←,m↑y ⋄ k←,m↑j ⋄ r←m⍴k\k/r
