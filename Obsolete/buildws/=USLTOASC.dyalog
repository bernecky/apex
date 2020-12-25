 Z←A ⍙USLTOASC V;B;I;J;M;R;S;W
 ⍝Transliterates third-case letters in ⍵ to lowercase or {A_} {B_} {C_}
 ⍝ If A=1, third-case letters become {A_} {B_} {C_}.
 ⍝ If A=0, they become secondary-case letters.
 S←⍙ALPHS          ⍝ alphabets on this system
 Z←V
 →(3>1↑⍴S)/0       ⍝ no change if only 2 alphabets
 I←S[3;]⍳V         ⍝ lookup in 3rd case
 B←I≤1↓⍴S          ⍝ 1s mark 3rd case letters in input
 →A/L1             ⍝ If user doesn't want to preserve 3rd case,
 Z[B/⍳⍴B]←S[2;B/I] ⍝    convert to secondary case
 →0                ⍝ Else, transliterate
L1:W←1+3×B         ⍝ width of each char in output
 Z←(¯1↑M←+\W)⍴' '
 Z[M]←V            ⍝ insert 3 blanks to left of 3rd case letters
 R←((+/B),4)⍴'{A_}'⍝ replacement prototype
 J←S[;1]⍳'A'       ⍝ row holding uppercase
 R[;2]←S[J;B/I]    ⍝ insert appropriate letter
 Z[(B/M)∘.+¯3 ¯2 ¯1 0]←R ⍝ replace 3rd case letters
 ⍝ Copyright (c) 1994 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
