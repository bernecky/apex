 r←x ssmark y
 ⍝ String search and mark strings
 ⍝ Assumes no overlapping strings
 r←y⍷x
 r←r∨(-¯1+⍴y)⌽r
 r←r∨≠\r
