 snBx;j;n;astr;row
 ⍝ Left bracket [ left of expression
 m←']'StackMatchBracket 0
 ⍝ Replace stacked indices with head of index list generated from same.
 j←StackPop m
 n←''⍴⍴j ⍝ # ast entries for index list
 c←c-1 ⍝ Push cursor past left bracket
 ⍝ Build ast entries for indexes between brackets
 ⍝ We now have indexed ref, indexed assign,
 ⍝ or bracket axis (under const)
 ⍝ Need 1 ast entry per row
 astr←astNewRows n
 row←≢ast
 k←row+⍳n
 astr[;asttarget]←ER0 k
 astr[;astfn]←E,';' ⍝ Index list
 ⍝ The right argument is link to next index, or NULL
 ⍝ The left argument is the index value (may be NULL)
 astr[;astlarg]←⌽j[;Stkvalue] ⍝ Indices
 astr[;astclass]←astclassVARB
 astr[;astrarg]←NULL,ER0 ¯1↓k ⍝ Link them
 ast←ast append2Ast astr
 state←D stk[stkp;Stkstate]
 'Under confusion or under construction'assert state∊Stf,Stn,Sto,Sta,Stx
 k←((E ¯1+≢ast),(E clsexpn),E 0)Push Stl ⍝ Result of ref; now left bracket state
