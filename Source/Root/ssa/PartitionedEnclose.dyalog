 r←{x}PartitionedEnclose y
 ⍝ Partitioned enclose: Dyalog
 ⍝ ⎕ml=3
 :If 0=⎕NC'x'
     x←y=1↑y
 :EndIf
 r←(+\x)⊂y
