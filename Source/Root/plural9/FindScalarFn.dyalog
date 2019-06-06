 r←frg FindScalarFn fns;gf
⍝# Mark SxS or XxS scalar fn fragments
⍝ fns is fns; frg is the scalar fns
 gf←frg[;1],¨ER1 TS D Raze⍉frg[;2 3 6] ⍝ fn,XT,YT,ZT
 r←Raze⍉fns[;fnsfn,fnstypes]
 r←r∘.≡gf
