 Z←D ⍙EJCASE V;A;B;C;I;J;S;T
 ⍝Adjusts the case of Es and Js (e.g. 1E3, 2J3) in character array ⍵
 ⍝ If D=1, e and j in numbers are converted to uppercase
 ⍝ If D=¯1, E and J are converted to lowercase
 ⍝ If D=0, they're converted to the primary alphabet (⍙ALPHS[1;])
 S←⍴V
 V←,V
 C←⍙ALPHS[2 1;5 10]  ⍝ convert secondary e/j to primary e/j
 →(D=0)/L1
 C←(D=1)⊖2 2⍴'EJej'  ⍝ flip if going lower → upper
 ⍝ C[1;] is what we look for, C[2;] is what we change them to
L1:→(~∨/C[1;]∊V)/L2  ⍝ quit if nothing to convert
 A←'0123456789.¯_∆⍙',,⍙ALPHS ⍝ characters that can occur in names/numbers
 B←V∊A               ⍝ 1s mark names/numbers
 B←(B>¯1↓0,B)/⍳⍴B    ⍝ index of first char in each name/number
 J←(V∊C[1;])/⍳⍴V     ⍝ indices of Es and Js
 J←(∧/V[1⌈(⍴V)⌊J∘.+¯1 1]∊12↑A)/J ⍝ those between digits
 T←⍋B,J
 I←B[(T>⍴B)/+\T≤⍴B]  ⍝ index of 1st char of name/number each E/J occurs in
 J←(V[I]∊12↑A)/J     ⍝ weed out E/Js that occur in names, not numbers
 V[J]←C[2;C[1;]⍳V[J]]⍝ change the E/Js
L2:Z←S⍴V
 ⍝ Copyright (c) 1995 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
