 r←LC y;lc
⍝ Map y to lower case (dirnames,etc)
 lc←⎕AV
 lc[(⎕AV⍳'A')+(⍳26)-⍳1]←⎕AV[(⎕AV⍳'a')+⍳26]
 r←lc[⎕AV⍳y]
