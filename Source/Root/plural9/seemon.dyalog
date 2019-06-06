 r←seemon;fns;pv
 ⍝ A See monitor data, sorted by CPU time
 fns←⎕NL 3
 r←D ⎕MONITOR¨ER1 fns
 pv←⍒r[;0;2] ⍝ CPU time
 r←(fns,r[;0;])[pv;]
