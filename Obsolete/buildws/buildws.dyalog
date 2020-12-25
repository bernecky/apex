 {wif}buildws p;fns;b;⎕ML
⍝ Convert all .wif files in directory p
⍝ from aplascii to APL
 ⎕ML←3 ⍝ Stupid APL2 compat
 :If 0=⎕NC'wif'
     wif←'wif'
 :End
 wif←((0≠⍴wif)⍴'.'),wif
 fns←⎕SH'ls ',p,'/*.wif'
 ⎕FX¨ASCII2APL¨TFREAD¨fns
 ⎕LX←''
 b←⎕EX GRPA2A
 ⎕←⎕WSID←(p,'/',(⌽∧\⌽p≠'/')/p),'.dws'
 ⎕IO←0        ⍝ I know these are gratuitous...
 ⎕PP←16
 ⎕←'Now do a )save'
