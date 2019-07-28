 r←pb StackMatchBracket s;i;k
 ⍝ Find matching innermost paren/bracket (pb) at offset s from stkp
 ⍝ Result is the stk row with the pb that starts innermost nesting level
 ⍝ or ¯1 if not found.
 i←⊖s StackDrop stk ⍝ Detect syntax error in source program
 k←(<\i[;Stkvalue]∊E,pb)⍳1 ⍝ Innermost nesting
 r←(¯1,k)[k<≢i]
 :If r≥0
     'Illegal stacked state'assert(D i[r;Stkstate])∊Stn,Stf,Stl,Sto,Stx,Sta,StS
     'Missing right paren or bracket'assert pb=D i[r;Stkvalue]
 :EndIf
