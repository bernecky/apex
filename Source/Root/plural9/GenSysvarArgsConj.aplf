 r←fnsloprop GenSysvarArgsConj fns;b;ct
⍝# Get extra args for sysvars for part of a conjunction/adverb
 b←(1↑⍴fns)⍴0  ⍝ The no-sysvars-needed case
 fns[;fnsfn]←fns[;fnsloprop]
 fns[;fnslop,fnsrop]←E''
 ct←PFATqct PFATProperty fns
 b←b,'01'[(ct='1')∧∨/'D'=D fns[;,fnstypes]] ⍝ ⎕ct only for double calls
 b←b,PFATqio PFATProperty fns
 b←b,PFATqpp PFATProperty fns
 b←b,PFATqpw PFATProperty fns
 b←b,PFATqrl PFATProperty fns
 b←(b='1')×(⍴b)⍴⍳6
 r←b
