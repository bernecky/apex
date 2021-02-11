 r←x CheckSGIOOne cds;ast;fi;vars;vars2;MapSGIO;fns;AllVarbs
 ⍝ Check one function's SGI entries
 MapSGIO←D x[0]
 fns←D x[1]
 AllVarbs←D x[2]
 ast←D cds[ssaast]
 fi←fns⍳ast[dfnname;asttarget] ⍝ Function index
 vars←AllVarbs∊ast[;asttarget] ⍝ All vars in this fn
 vars2←ast[;asttarget]⍳vars/AllVarbs
 'bad astscope'assert∧/(vars/MapSGIO[;fi])≤ast[vars2;astscope]
 r←1
