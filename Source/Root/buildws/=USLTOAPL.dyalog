 Z←⍙USLTOAPL A;B;I;J;K;S
 ⍝Converts {A_}{B_}{C_} in ⍵ to underscored or lowercase letters
 I←(A='_')/⍳⍴A      ⍝ find _s
 I←((3≤I)∧I≤¯1+⍴A)/I⍝ exclude those too close to either end
 I←((A[I-2]='{')∧A[I+1]='}')/I ⍝ those that are part of {*_} phrase
 S←⍙ALPHS           ⍝ alphabets on this system
 J←S[S[;1]⍳'A';]⍳A[I-1]     ⍝ look up the letters
 B←J≤1↓⍴S           ⍝ 0s mark any unrecognized ones, e.g. {+_}
 K←2+3=''⍴⍴S        ⍝ 3 if this APL has underscored letters, else 2
 I←B/I
 A[I-1]←S[K;B/J]    ⍝ replace A in {A_} with underscored/lowercase letters
 B←(⍴A)⍴1
 B[I∘.+¯2 0 1]←0    ⍝ 0s mark where the { and _} are
 Z←B/A              ⍝ remove the { _}
 ⍝ Copyright (c) 1994-95 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
