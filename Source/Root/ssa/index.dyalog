 r←d index m;a;b
 ⍝------- simulates r←1 1 2⍉d[;m]
 b←1↓⍴d
 a←⍴m
 d←,d
 r←d[m+⍉b×(⌽a)⍴(⍳1↑a)-1]
