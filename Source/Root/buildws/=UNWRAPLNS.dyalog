 Z←⍙UNWRAPLNS A;B;I;T
 ⍝Restores long wrapped lines in CR-delimited vector ⍵
 ⍝ A long line may be indicated in two ways:  Either {+ at the
 ⍝ end of the line, followed by +} on the next line, or by {cont'd}
 ⍝ at the start of the continuation line.  Note that no spaces
 ⍝ are added when either of these continuation marks is removed;
 ⍝ any necessary spaces must be included in the text to the left
 ⍝ or right of the {+ +} or to the right of the {cont'd}.
 ⍝
 Z←A
 →(~1∊(Z='{')∧(1⌽Z)∊'+cC')/0    ⍝ return arg unchanged if no continuations
 A←⍙VTOM ⍙TCNL,A
 T←⍙LJUST A
 I←(((1↑⍴T),2)↑T)∧.='+}'        ⍝ find +} style continuation lines
 I←I∨(⍙TOLOWER((1↑⍴T),8)↑T)∧.='{cont''d}' ⍝ and the {cont'd} ones
 I←I/⍳⍴I
 A[I;]←T[I;]                    ⍝ left-justify continuation lines
 A←1↓⍙TCNL ⍙MTOV A              ⍝ this also deletes trailing blanks
 T←(A=⍙TCNL)/⍳⍴A                ⍝ find the CRs
 I←((2<T)∧T≤¯2+⍴A)/T            ⍝ not too close to either end
 I←(A[I∘.+¯2 ¯1 1 2]∧.='{++}')/I⍝ those that are part of a continuation
 B←(⍴A)⍴1
 B[I∘.+3-⍳5]←0                  ⍝ zero out where {+CR+} occurs
 ⍝ Repeat for the {cont'd} phrases:
 I←(T≤¯8+⍴A)/T                  ⍝ CRs not too close to the end
 I←((⍙TOLOWER A[I∘.+⍳8])∧.='{cont''d}')/I ⍝ CRs followed by {cont'd}
 B[I∘.+¯1+⍳9]←0                 ⍝ zero out were CR{cont'd} occurs
 Z←B/A                          ⍝ remove continuation marks
 ⍝ Copyright (c) 1994-95 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
