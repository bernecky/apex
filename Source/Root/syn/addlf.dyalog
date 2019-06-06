 r←addlf y;i
 ⍝ Add LF to text with CRs
 r←(1+y=CR)/y
 i←r=CR
 r[i/⍳⍴r]←(+/i)⍴CR,LF
