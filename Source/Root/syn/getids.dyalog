 r←src getids tok;i;j
 ⍝ Get ids in source text
 j←,0,tok∊clsid,clsqdnm
 i←squeeze j\j/,' ',src
 r←((0≠⍴i)⍴' '),i
 r←1↓¨PartitionedEnclose r
