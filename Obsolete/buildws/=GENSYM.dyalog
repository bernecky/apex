 Z←⍙GENSYM P
 ⍝Returns an available name starting with prefix ⍵
 P←,P
 Z←((⍴Z)⌈0 1×⍴P)↑Z←(1↑P)⎕NL 2
 Z←((Z[;⍳⍴P]∧.=P)∧∧/((0 1×⍴P)↓Z)∊' 0123456789')⌿Z ⍝ existing vars w. prefix
 Z←,⍎'0',,' ',(0 1×⍴P)↓Z ⍝ the suffixes
 Z←P,⍕((⍳⍴Z)∊Z)⍳0        ⍝ lowest available name
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
