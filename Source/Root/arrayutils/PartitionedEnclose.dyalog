﻿ r←{x}PartitionedEnclose y;⎕ML
 ⍝ Partitioned enclose: Dyalog
 ⎕ML←1
 :If 0=⎕NC'x'
     x←y=1↑y
 :EndIf
 r←x⊂[0]y
