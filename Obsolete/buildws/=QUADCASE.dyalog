 Z←D ⍙QUADCASE M;A;J
 ⍝Converts the case of quad names in array ⍵
 ⍝ Converts names to uppercase if D=1, to lowercase if D=¯1
 ⍝ If D=0, converts names to the primary alphabet (⍙ALPHS[1;])
 Z←,M
 J←(⍴Z)⌊((Z='⎕')/⍳⍴Z)∘.+⍳12⍝ indices of chars following ⎕
 A←⍙ALPHS[2 1;]            ⍝ convert secondary to primary
 →(D=0)/L1
 A←'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
 A←(D=1)⊖A,[0.5]'abcdefghijklmnopqrstuvwxyz'
 ⍝ A[1;] is what we look for; A[2;] is what we change it to
L1:J←(,∧\Z[J]∊A)/,J        ⍝ indices of letters of ⎕ names
 J←(Z[J]∊A[1;])/J          ⍝ indices of uppercase letters
 Z[J]←A[2;A[1;]⍳Z[J]]      ⍝ convert to lowercase
 Z←(⍴M)⍴Z
 ⍝ Copyright (c) 1995 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
