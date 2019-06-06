 r←MacroParms y;i
 ⍝ Break {this}{and}{that} into
 ⍝ a vector of vectors
 ⍝ For better or worse, we delete text between
 ⍝ bracket pairs, e.g. {this} is gone {that}
 ⍝ will drop out the "is gone" text.
 r←⍳0
lp:→(0∊⍴y)⍴0
 y←(∨\y='{')⌿y ⍝ Drop leading stuff.
 i←'{}'FindMatchingBracket y
 r←r,E 1↓¯1↓i/y ⋄ y←(~i)/y
 ⍝ We trim off leading blanks and NLs that
 ⍝ confuse the matching bracket finder. This
 ⍝ permits things like:  {foo}  {goo}
 ⍝ to work properly. Otherwise, it loops until
 ⍝ you get impatient.
 y←(∨\~y∊' ',NL)/y
 →lp
