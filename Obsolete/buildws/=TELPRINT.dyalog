 Z←PW ⍙TELPRINT M;C;D;N;R;S;U;W;X;Y
 ⍝Wraps matrix ⍵ in multiple columns across the page
 ⍝ M is a character or numeric matrix
 ⍝ PW[1] is the page width,  PW[2] is the page length
 ⍝ Z is a character matrix not more than PW[1] columns wide
 ⍝ Requires the ⍙OVER subroutine
 ⍝
 ⍎(0=⎕NC'PW')/'PW←⎕PW'
 PW←2↑PW,999999
 D←0 0
 →(0≠1↑0⍴M)/L1
 M←(2↑(⍴M),1 1)⍴M ⍝ coerce vector to 1-column matrix
 M←'|',' ',' ',⍕M
 D←0 3            ⍝ amount to drop from wrapped result below
L1:W←2++/∨\⌽M≠' '
 Z←0 0⍴''
L2:N←1⌈(⍴W)⌊⌊(2+1↑PW)÷C←1⌈⌈/W ⍝ min number of "supercolumns" that will fit
L3:R←PW[2]⌊⌈(⍴W)÷N←N+1
 U←+/X←2⌈⌈/S⍴(×/S←N,R)↑W
 →((N<⍴W)∧U<PW[1]+2)/L3
 R←PW[2]⌊⌈(⍴W)÷N←N-U>PW[1]+2
 X←⌈/S⍴(×/S←N,R)↑W
 Y←(R,C×N)⍴2 1 3⍉(N,R,C)⍴((N×R),C)↑M
 Y←D↓0 ¯2↓(,X∘.≥⍳C)/Y
 Z←Z ⍙OVER Y
 →(PW[2]≥⌈(⍴W)÷N)/0
 M←((R×N),0)↓M
 W←(R×N)↓W
 →L2
 ⍝ Copyright (c) 1978-1988 by Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
