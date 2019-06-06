 r←ast MarkSpecialCasesEpio fns;spec;epio;tar;cv
⍝# Generate special case names for indexof and set membership
⍝# Today, we support "⎕av⍳⍵" and "⍺∊⎕av". Yes, the latter is silly.
⍝# Eventually, we could trivially support
⍝# "sortedarray⍳⍵" and "⍵∊sortedarray", but I'm busy just now...
 epio←(ER1⍪'⍳∊')⍳ast[;astfn]
⍝ Indexof
 tar←(epio=0)⌿ast[;astlarg]
 cv←~tar∊NULL
 spec←(epio=0)\cv\D ast[cv/tar;astvalue]≡¨E ⎕AV
⍝ Set membership
 tar←(epio=1)⌿ast[;astrarg]
 cv←~tar∊NULL
 spec←spec∨(epio=1)\cv\D ast[cv/tar;astvalue]≡¨E ⎕AV
 fns[(spec≠0)/⍳⍴spec;fnsspec]←E'QUADAV'
 r←fns
