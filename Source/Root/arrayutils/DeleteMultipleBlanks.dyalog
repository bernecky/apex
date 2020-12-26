DeleteMultipleBlanks←{
p←(~InQuotes ⍵) ∧ ~(InComment ⍵)
cv←⍵=' ' ⋄ cv←cv∧~cv>0,¯1↓⍤1⊢cv
(~p∧cv) {(⍺/⍵),(+/~⍺)⍴' '}⍤1⊢⍵
}

