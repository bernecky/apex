 r←GetBlistFns nm;p;fnm
⍝ Return fully-qualified function names in directory nm
 p←Path nm ⍝ Path only
 fns←ReadFile nm,PathDelim,'blist.cu'
 fns←vtom NL,(fns≠CR)/fns ⍝ Kill BillWare(tm) CR
 fns←(fns∨.≠' ')⌿fns ⍝ Ignore blank lines
 r←dtb¨(E nm,PathDelim),¨ER1 fns
