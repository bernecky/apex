 Z←A DOVER B;S
 ⍝Forms a matrix with ⍺ over ⍵
 →(S←''⍴(⎕STPTR  'Z A B')⎕CALL  DOVER∆OBJ)↓0
 →(S=1)/L1
 ⎕ERROR  (2 3 4⍳S)⊃'RANK ERROR' 'WS FULL' 'SYNTAX ERROR' 'DOMAIN ERROR'
 ⍝ Use an APL version for mixed types, Booleans, or nested:
L1:S←⍴A←(¯2↑1 1,⍴A)⍴A
 S←0 1×S⌈⍴B←(¯2↑1 1,⍴B)⍴B
 Z←(A←(S⌈⍴A)↑A),[⎕IO]B←(S⌈⍴B)↑B
 ⍝ Copyright (c) 1988, 1994 by Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
