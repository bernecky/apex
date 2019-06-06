 r←src QuadnameLC tok;b
⍝ Convert all upper-case system names to lower-case names
⍝ e.g., ⎕AV becomes ⎕av
 b←,tok∊clsqdnm
 r←,src
 r[b/⍳⍴b]←LC b/r
 r←(⍴src)⍴r
