 g
lp:zz←⎕FX ASCII2APL TFREAD⊃fns[i]
 →(' '≠1↑0⍴zz)⍴0.1
 i←i+1
 ⎕←zz
 →lp
