 r←cls GetConstants y;src;cv;len;beg;tok;con
 ⍝ Get constants of class cls from function.
 ⍝ y is src⊃tok
 src←(D y[0]),NullChar ⋄ tok←(D y[1]),NullChar
 con←0⍴E''
 ⍝ NullChar allows us to rebuild matrix form later
 cv←tok∊cls ⍝ Locate constants, handle end of line
 :If 1∊cv ⍝ Any work?
     beg←cv>¯1⌽cv ⍝ Start of each constant
     len←1↓(1,,beg)pplusreduce 1,,cv ⍝ Length of each constant
     con←(,cv)/,src ⍝ Extract constants
     con←(D Raze len↑¨1)PartitionedEnclose con 
     ⍝ Separate them
⍝⍝⍝⍝ con←(con,E cls),E 1 ⍝ Append symbol class and local scope
     ⍝ Just the unique ones.
     con←,D nub ER1 con 
 :EndIf ⍝ Any work?
 r←con⍝⍝⍝⍝ disabled  ,(E,'1'),E,'2' ⍝ Just for argv()
