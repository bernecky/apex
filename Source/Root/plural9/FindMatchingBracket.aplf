 r←x FindMatchingBracket y;cv
 ⍝ In an expression such as {this {and} that}{and this}
 ⍝we want matching bracket mask, to extract
 ⍝ {this {and} that}
 ⍝ y starts with x[0], matched with x[1]
 cv←∧\0≠+\(y=x[0])-y=x[1]
 r←cv∨0,¯1↓cv ⍝ Get last char
