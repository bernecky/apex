 r←src QuadnameNiladicKludge tok;nfn
 ⍝ Undo another APL design error
 ⍝ Convert systemnfns token classes to niladic fns
 r←tok
 :For nfn :In systemnfns
     r←nfn QuadNameNiladicKludgeOne(E src),E r
 :EndFor
