 r←UC y;t
⍝ Upper case
 t←⎕AV
 t[(⎕AV⍳'a')+⍳26]←t[(⎕AV⍳'A')+⍳26]
 r←t[⎕AV⍳y]
