 Z←⍙FMTVAL A;E;I;S;⎕PP
 ⍝Formats array value ⍵ for A2A transfer
 E←('DYALOG'∧.=6↑⍙APLVER),'APL68K'∧.=6↑⍙APLVER
 ⎕PP←(16 15 17)[E⍳1]     ⍝ maximize
 E←×/S←⍴A                ⍝ element count
 I←(2≤⍴S)∨E=0            ⍝ If rank ≥2 or A is empty
 I←I∨(E=1)∧1=⍴S          ⍝ or if A is a 1-elt vector,
 Z←I/(⍕S),'⍴'            ⍝    start with "shape ⍴"
 A←,A
 →(⍙IFNEST A)/L3         ⍝ jump if nested
 →(' '=1↑0⍴A)/L1         ⍝ If numeric,
 ⍎(E=0)/'A←0'            ⍝    reshape 0 if empty
 A←⍕A                    ⍝    format the numbers
 →L2                     ⍝ Else, character,
L1:A←'''',((1+A='''')/A),'''' ⍝    quote it
 ⍝ *** ↑ The / is replicate; may not be available on all systems
 Z←(~(E=0)∧1=⍴S)/Z       ⍝    omit the 0⍴ for empty vector
L2:Z←Z,A
 →0

 ⍝ Recurse on each item of a nested/heterogeneous/boxed array
L3:I←0
 ⍎(0∊S)/'A←1↑A'          ⍝ get prototype if A is empty
 S←'IPSA'∧.=4↑⍙APLVER    ⍝ 1 if on Sharp APL
 S←((~S)/'I⊃A'),S/'>A[I]'⍝ how to pick the Ith element of A
 E←⍴A
L4:→(E<I←I+1)/0          ⍝ Loop for each item
 Z←Z,(1↑(E>1)↓'⊂('),(⍙FMTVAL⍎S),(E>1)/')'
 →L4                     ⍝ Endloop
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
