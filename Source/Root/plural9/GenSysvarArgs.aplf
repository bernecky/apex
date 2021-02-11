 r←GenSysvarArgs fns;b
⍝# Get extra args for sysvars used by fns
⍝# Result order is (in) f g f.g (out) f g f.g.
⍝# g entry is for function-only invocation
⍝ Distinguish between fn and adv/conj entries
 :If ∧/,fns[;fnslop,fnsrop]∊E'' ⍝ Any adv/conj?
     r←E fnsfn GenSysvarArgsConj fns ⍝ fn only
     r←(E 0×D r),r
 :Else
     r←E fnslop GenSysvarArgsConj fns   ⍝ f.g
     r←r,E fnsrop GenSysvarArgsConj fns
 :EndIf
 r←r,E(D r[0])⌈D r[1]              ⍝ f.g in
 ⍝ The only Outie is ⎕rl, which is also an Innie
 r←r,r×E(⍴D r[0])⍴0 0 0 0 1 ⍝ ⎕rl is last entry
