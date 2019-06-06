 Z←⍙DEDUBL A;I;S;X;Y
 ⍝Translates ASCII symbols in ⍵ to the corresponding APL characters
 ⍝ Some APL systems have two copies of certain characters in ⎕AV,
 ⍝   with one copy being an APL functional symbol and the other an
 ⍝   ASCII symbol.  For example, APL*PLUS has two vertical bars, one
 ⍝   used for residue and the other as ASCII stile.
 ⍝ This function eliminates the nonfunctional ASCII symbols, which,
 ⍝   because of their system-dependent nature, are not usually wanted.
 ⍝
 →(~('APLPLUS'∧.=7↑⍙APLVER)∨'IPSA'∧.=4↑⍙APLVER)/L1
 X←,'|'         ⍝ find split-stiles
 Y←,'|'         ⍝ replace with APL stile
 →L2
L1:→('DYALOG'∨.≠6↑⍙APLVER)/L3
 X←⎕AV[⎕IO+219 235 238] ⍝ ASCII quote, caret, stile
 Y←⎕AV[⎕IO+13 167 192] ⍝ change to APL symbols
L2:S←⍴A
 I←(A∊X)/⍳⍴A←,A ⍝ indices of chars to translate
 A[I]←Y[X⍳A[I]] ⍝ replace 'em
 Z←S⍴A          ⍝ restore original shape
 →0
L3:Z←A          ⍝ no doubled characters on this APL
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
