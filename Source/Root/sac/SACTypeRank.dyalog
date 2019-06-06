 r←tp SACTypeRank rk;lft;dots;rt
⍝ This uses ast or fns arguments.
⍝ Return SAC type and rank specifier for
⍝ arguments of type tp and rank rk,
⍝ e.g., [.,.] for 'i' TypeRank 2
 →(~0∊⍴tp)⍴notmt ⍝ STUPID APL2 empties suck dead bears
 r←E 0 1⍴'' ⋄ →0
notmt:
 :If ~IsChar tp
     tp←Types[(⍳¯1+⍴Types)⍳tp]
 :EndIf
 :If IsChar rk
     rk←10|'0123456789'⍳rk ⍝ Array rank
 :EndIf
 tp←TSAC tp
 lft←(×0⌈rk)⍴¨'['
 rt←(×0⌈rk)⍴¨']'
 dots←(0⌈¯1+2×rk)⍴¨E'.,'
 r←Raze⍉tp,lft,dots,rt
