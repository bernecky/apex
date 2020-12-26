 MarkFirstInnerDfn←{
     p←,(~#.arrayutils.InQuotes ⍵)∧~(#.arrayutils.InComment ⍵)
     b←,⍵∊'{'
     e←,⍵∊'}'
     cv←+\p×b+¯1×e
     cv←cv=1⌈⌈/cv
     cv←cv∨0,¯1↓cv
 ⍝ Just the first one
     (-⍴cv)↑∧\((<\cv)⍳1)↓cv
 }
