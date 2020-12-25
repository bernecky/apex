 Z←N ⍙FMTVAR V;T;W
 ⍝Formats a variable for A2A transfer
 ⍝ N is the variable name, V is the array value, Z is a character matrix
 Z←'∇.    ',((N≠' ')/N),'←'
 Z←Z,⍙FMTVAL V
 ⍝ Translate newline as {nl} in arrays:
 'T←⍙MUTE''Z←APL2ASCII Z'''⍙WITHTTX ⍙TTABX ⍙OVER ⍙TCNL,' {nl}'
 ⍝ ↑ Use ⍙MUTE to avoid warning messages about any braces in the value
 →(⍙PGWID<⍴Z)/L1       ⍝ If result fits on one line,
 Z←(1,⍴Z)⍴Z            ⍝    do no wrapping
 →0                    ⍝ Else,
L1:                    ⍝    wrap lines...

 ⍝ Smart (but slow) wrappin'.  Avoids splitting keywords across line
 ⍝  breaks, which is useful if you want to search or edit the text.
 ⍝ Z←(1↑⍙PGWID)⍙WRAPLNS(1,⍴Z)⍴Z
 ⍝ →0

 ⍝ Fast blind wrappin':
 T←((⍙PGWID-2)↑Z),'{+' ⍝    the first line
 Z←(⍙PGWID-2)↓Z        ⍝    rest of the data
 W←⍙PGWID-⍴'+}{+'      ⍝    how much data fits on each line
 N←⌈(⍴Z)÷W             ⍝    num rows required
 Z←(N,W)⍴(N×W)↑Z       ⍝    wrap the defn
 →(N=0)/L2
 Z←((N,2)⍴'+}'),Z,(N,2)⍴'{+'⍝   add the {+ +}s
 Z[''⍴⍴Z;¯1 0+1↓⍴Z]←' '⍝    blank out {+ on last line
L2:Z←T,[1]Z            ⍝    add the 1st line
 →0
 APL2ASCII ⍙MUTE       ⍝ accessed thru ⍎
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
