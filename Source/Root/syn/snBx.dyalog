 snBx;j;n;astr
 ⍝ Left bracket [ left of expression
 m←']'StackCheck⍳stkp
 ⍝ Replace stacked indices with head of index list generated from same.
 j←stkpop m
 n←''⍴⍴j ⍝ # ast entries for index list
 c←c-1 ⍝ Push cursor past left bracket
 ⍝ Build ast entries for indexes between brackets
 ⍝ We now have indexed ref, indexed assign,
 ⍝ or bracket axis (under const)
 ⍝ Need 1 ast entry per row
 astr←astNewRows n
 k←astp+⍳n
 astr[;asttarget]←ER0 k
 astr[;astfn]←E,';' ⍝ Index list
 ⍝ The right argument is link to next index, or NULL
 ⍝ The left argument is the index value (may be NULL)
 astr[;astlarg]←⌽j[;Stkvalue] ⍝ Indices
 astr[;astclass]←astclassVARB
 astr[;astrarg]←NULL,ER0 ¯1↓k ⍝ Link them
 Append2Ast astr
 state←D stk[stkp;Stkstate]
 'Under confusion or under construction'assert state∊Stf,Stn,Sto,Sta,Stx
 k←((E astp-1),(E clsexpn),E 0)Push Stl ⍝ Result of ref; now left bracket state
