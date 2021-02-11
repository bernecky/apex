DfnAlphaOmega←{
⍝ Replace refs in matrix ⍵  to arguments ⍺ and ⍵  by named temps
⍝ Result is updated ⍵, temp names for ⍺ and ⍵
⍝ If there are no references to ⍺ in ⍵, we do not generate nma.
⍝ Otherwise, the interpreter complains that:
⍝ 'function requires a left argument'
src←' ',⍵  ⍝ blank to avoid inter-line identifier mixing
cv←,(~InQuotes src)∧~InComment src
dfn←,src
nma←((E''),TempName E'alpha ')['⍺'∊dfn]
dfn[(cv∧dfn∊'⍺')/⍳⍴dfn]←nma
nmo←TempName E'omega '
dfn[(cv∧dfn∊'⍵')/⍳⍴dfn]←nmo
dfn←NL mtov (⍴src)⍴dfn
dfn←vtom NL,D Raze dfn
nma←D nma ⋄ nmo←D nmo
(dfn nma nmo)
}


