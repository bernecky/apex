﻿ r←EmitDyadicInnerProduct fns;cv;n;k;j;sis
 ⍝ Emit Dyadic conj fn SAC code
 ⍝ Kludge for inner product, outer product:
 ⍝ frags assume limited set of astlop values
 sis←E''
 :If ~0∊⍴fns
     ctl←6 FragmentCode'dconj'
     cv←fns[;fnsfn]∊E'dot' ⍝ Just dot prod today.
     cv←cv∧~fns[;fnslop]∊E'jot' ⍝ No outer products
     :If 1∊cv ⍝ Got work?
   ⍝ Use each as it's too hard to do them in parallel.
         sis←nub D Raze⍉EmitInnerProductOne¨mm¨ER1 cv⌿fns
         fns←(~cv)⌿fns
     :EndIf
 :EndIf
 r←(E sis),E fns
