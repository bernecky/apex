 unbuildws p;fns;⎕IO;fnm;blist;def
⍝ Write all fns in current ws as .wif files in folder p.
⍝ This fn and buildws are supposed to be inverses
 ⎕IO←0
 def←¯11↑⎕WSID
 def←(def≠' ')/def
 p←p,(0=⍴p)/'apex2003/benchmks/',def
 fns←⍙DTB¨⊂[1]⎕NL 3
 fns←(~fns∊⍙DTB¨⊂[1]GRPA2A)/fns
 blist←⊃⍪/fns,¨⊂'.wif',⎕TC[2]  ⍝ Dyalog ⎕ml=3
 fnm←⍙RJUST¨(⊂p,'/'),¨fns,¨⊂'.wif'
 (APL2ASCII¨⎕CR¨fns)TFWRITE¨fnm
 blist TFWRITE p,'/blist.cu'
