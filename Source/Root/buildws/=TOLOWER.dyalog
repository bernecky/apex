 z←⍙TOLOWER y;⎕IO
⍝ Translate uppercase letters to lowercase in y
⍝ Robert Bernecky 2003-05-05
 ⎕IO←0
 z←⎕AV
 z[(⎕AV⍳'A')+⍳26]←⎕AV[(⎕AV⍳'a')+⍳26]
 z←z[⎕AV⍳y]
