 stkpush y;i
 ⍝ Push y onto stack.
 i←''⍴⍴y←mm y
 stk[stkp+⍳i;Stkstate,Stkvalue,Stktokcl]←y
 stkp←stkp+i
