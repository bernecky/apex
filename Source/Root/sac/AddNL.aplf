 r←AddNL y;i;t
 ⍝ Convert CRs to CRLFs for DOS
 ⍝ We don't need no steenking Windows.
 r←y
 →0
 t←(y≠LF)/y ⍝ Kill extant LFs
 i←t=CR
 r←(1+i)/t ⍝ Make room for LFs
 i←r∊CR
 r[i/⍳⍴i]←(+/i)⍴CR,LF
