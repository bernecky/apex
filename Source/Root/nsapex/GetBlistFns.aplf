 r←GetBlistFns nm;p;fnm
⍝ Return fully-qualified function names in directory nm
 p←#.fileutils.Path nm ⍝ Path only
 fns←#.fileutils.GetFileChar nm,#.globals.PathDelim,'blist.cu'
 fns←vtom NL,(fns≠CR)/fns ⍝ Kill BillWare(tm) CR
 fns←(fns∨.≠' ')⌿fns ⍝ Ignore blank lines
 r←dtb¨(E nm,#.globals.PathDelim),¨ER1 fns
