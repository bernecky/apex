 r←pb StrandItems s;i;p
 ⍝ Strand or index list items from offset s into stk
 ⍝ Empty if not a strand
 i←⊖s StackDrop stk ⍝ Detect syntax error in source program
 p←(≢i)|i[;Stkvalue]⍳E,pb ⍝ Innermost nesting
 r←p↑i
 'Illegal stacked state'assert(D r[;Stkstate])∊Stn,Stf,Stl,Sto,Stx,Sta,StS
 r←r[;Stkvalue]
