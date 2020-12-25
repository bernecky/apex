 sfx convertdir p;fns;fnsout;i
⍝ Convert all *.sfx files in directory p
⍝ to aplascii form
 :If 0=⎕NC'sfx'
     sfx←''
 :End
 sfx←((0≠⍴sfx)⍴'.'),sfx
 fns←,' ',⎕lib p
 b←fns≠' '
 fns←(b∨1⌽b)/fns
 fns←1↓¨(fns=' ')⎕penclose fns
 fns←(⊂p,'/'),¨fns
 (APL2ASCII¨TFREAD¨fns)TFWRITE¨fns,¨⊂'.wif'
