 r←ast IndexType mil;i;il;j
⍝ Type of each index in index list mil
 i←,~mil∊0,D NULL
 il←i/,mil ⍝ Valid ast indices
 j←D ast[il;asttype]
 r←i\j
 r[(,mil∊D NULL)/⍳⍴,mil]←D NULL
 r←(⍴mil)⍴r
