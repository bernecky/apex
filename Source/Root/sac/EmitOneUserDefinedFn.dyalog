﻿ r←EmitOneUserDefinedFn asts;ast;fnm;rap;s;newasts;j;fns;wif;sis
 ⍝ Emit code for one user-defined function
 ⍝ Result is code & required library fns
 ast←D asts[ssaast]
 wif←D asts[ssawif]
⍝⍝⍝⍝⍝⍝⍝ ast←PhraseRecognizer ast ⍝ Replace phrases
 newasts←asts ⋄ newasts[ssaast]←E ast
 fnm←D ast[dfnname;asttarget] ⍝ Function name
 newasts←FORRename newasts ⍝ Fix ast names for X vs OLD X in :FOR loops
 rap ast←((1,fnscols)⍴E'')FunctionWrapper D newasts[ssaast]
 ast←ConstantsSAC ast ⍝ Convert constants to SAC form
 newasts[ssaast]←E ast
 j←EmitUserDefinedFunctionBody newasts ⍝ Emit all fns
 sis←D j[0]
 fns←D j[1]
 ast←D j[2]
 s←D rap[0]
 'Silly bugger'assert~1∊('/*'⍷wif)∨'*/'⍷wif
 wif←(1+wif∊CR)/wif ⍝ Room for spaces
 j←(wif∊CR)/⍳⍴wif
 wif[j]←(⍴j)⍴NL,' ' ⍝ Stupid BillWare(tm)
 wif←NL,'/*',NL,' ',wif,NL,'*/',NL
 sis←D Raze s,wif,sis,rap[1]
 r←(E sis),E fns ⍝ SAC & fns list
