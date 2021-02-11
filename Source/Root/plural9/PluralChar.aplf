 r←PluralChar y;cv
⍝# Turn 'abc' into Plural constants  'a','b','c'
⍝# Turn non-printables into hex constants
 y←,y
 :If ∧/y∊PrintableASCII
     r←¯1↓,⍉(''''dcb((1,⍴y)⍴y)dcb'''')dcb','
     cv←(⍴r)⍴0 1 0 0 ⍝ Mark original characters
     r←(1⌈cv+r='''')/r ⍝ Double original quotes.
     cv←''''''''''⍷r   ⍝ No, you're not seeing double.
     r[1+cv/⍳⍴cv]←'\'  ⍝ SAC uses \' for quote.
 :Else
 ⍝ Generate hex constants for ⎕av, etc.
     r←⍉'0123456789abcdef'[16 16⊤⎕AV⍳y]
     r←'<''\x>,2A1,<'',>'⎕FMT r
     r←,r,(1↑⍴r)⍴¯8↑NL ⍝ Pretty printing only
     r[¯2+⍴r]←' '      ⍝ Kill trailing comma
     r←(r≠' ')/r       ⍝ Pretty printing only
 :EndIf
