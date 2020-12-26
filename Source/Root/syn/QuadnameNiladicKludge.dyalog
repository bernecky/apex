 r←src QuadnameNiladicKludge tok;nfn
 ⍝ Undo another APL design error
 ⍝ Convert sysnfns token classes to niladic fns
 r←tok
 :For nfn :In #.globals.sysnfns
     r←nfn QuadNameNiladicKludgeOne(E src),E r
 :EndFor
