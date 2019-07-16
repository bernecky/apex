 r←x StackCheck y;i;k;m
 ⍝ Check stack state for paren/bracket expn
 ⍝ Result is stk row that starts innermost nesting level
 i←stackent,y ⍝ Detect syntax error in source program
 k←<\i[;Stkvalue]∊(E,')'),E,']' ⍝ Innermost nesting
 m←''⍴k/⍳⍴k
 'Illegal stacked state'assert(D i[m;Stkstate])∊Stn,Stf,Stl,Sto,Stx,Sta
 'Missing right paren or bracket'assert x=D i[m;Stkvalue]
 r←m
