﻿ sngx;i
 ⍝ State is expression, signal is goto
 ⍝ Can't use gett because it'll get -⍳ as a fn.
 ⍝ goto must be root of statement.
 i←(c↑tok)≡((0⌈c-1)⍴clsid),clscolon ⍝ Label is ok.
 'Source program syntax error: Goto not root of statement'assert i∨c=0
 'Compiler bug'assert stkp=1 ⍝ Only one item on stack, please.
 ⍝ GOTO looks like monadic function invocation from here.
 astr←,astNweRows 1 ⍝ Build new ast entry
 astr[asttarget]←E astp
 astr[astfn]←E src[,c] ⍝ The goto an sich
 i←stkpop 1 ⍝ The branch argument
 'Source program syntax error: GOTO arg not expn'assert i[0;0]∊(E Stx),E Stn
 astr[astrarg]←i[0;1] ⍝ The branch argument
 astpush astr
 ⍝ We leave the stack empty.
 state←Stn ⍝ Effectively, empty statement now.
