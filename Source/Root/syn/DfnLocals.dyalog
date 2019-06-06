DfnLocals←{
⍝ Return list of local names assigned in matrix ⍵
⍝ This is very crude, as we may have:
⍝  r←42
⍝  r[123]←42
⍝  (a b c)←42
⍝  d← 10 + (a b c)←42
⍝  For now, we just pick up ALL identifiers
⍝  to the left of ← and call them local!

⍝  FIXME: Except for Z, the kludge result today
src←' ',⍵  ⍝ blank to avoid inter-line identifier mixing
cv←(~InQuotes src)∧~InComment src
tok←tokenize src
cv←⌽∨\⌽cv∧src='←'
cv←cv∧tok∊clsid
ids←(,cv)\(,cv)/,src
cv←,cv>0,0 ¯1↓cv
r← nub dtb¨cv PartitionedEnclose ids
r←(~r∊⍺)/r ⍝ function names are not locals
r←(~r∊E,'Z')/r ⍝ FIXME KLUDGE Dfn result
r
}


