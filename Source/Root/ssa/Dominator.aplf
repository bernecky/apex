 r←Dominator cfg;dom;sz;i;olddom;idm
 ⍝ Gen dominator tree for ctl flow graph cfg
 idm←id sz←1⍴⍴cfg
 dom←idm∨1 ⋄ dom[0;]←sz↑1
lp:olddom←dom ⋄ i←1 ⍝ Entry node done.
lp2:dom[i;]←idm[i;]∨∧⌿(cfg Predecessor i)⌿dom
 →(sz≠i←i+1)⍴lp2
 →(~dom≡olddom)⍴lp
 r←dom
