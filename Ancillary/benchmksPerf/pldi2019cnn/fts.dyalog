 r←fts y
⍝ Format ⎕ts value into iso timestamp
 r←'ZI4,<->,ZI2,<->,ZI2,< >,ZI2,<:>,ZI2,<:>,ZI2,<.>,ZI3'
 r←r ⎕FMT(¯2↑1 1,⍴y)⍴y
 r←((¯1↓⍴y),¯1↑⍴r)⍴r ⍝ Get result to proper rank
