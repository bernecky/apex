 r←{x}PartitionedEnclose y
 ⍝ Partitioned enclose: Dyalog
 ⍝  ⎕ML=1
 :If 0=⎕NC'x'
     x←y=1↑y
 :EndIf
 r←x⊂y
