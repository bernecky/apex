 Z←APL2ASCII A;B;C;D;I;K;M;N;P;R;S;W;X;⎕IO
 ⍝Translates APL symbols in message ⍵ to ASCII strings
 ⍝ Arguments:
 ⍝      A  - the message to transliterate, either a character matrix or
 ⍝           newline-delimited vector.
 ⍝  ⍙TTABX - (global) translate table created by MAKETTAB.
 ⍝  KEEPUS - (optional global variable)  If KEEPUS=1, the third
 ⍝           alphabetic case is transliterated as {A_} {B_} {C_} etc.,
 ⍝           and ASCII synonyms of APL symbols become {'} {∧} {|} etc.
 ⍝           If KEEPUS=0 or is undefined, the third case is mapped to
 ⍝           the secondary case (⍙ALPH[2;]), and ASCII synonyms are
 ⍝           replaced by their APL counterparts.
 ⍝ Result:
 ⍝      Z  - transliterated message (contains only ASCII characters).
 ⍝           Has the same representation (matrix or vector) as A.
 ⍝
 ⎕IO←1
 K←0                   ⍝ default is KEEPUS=0
 →(0=⎕NC'KEEPUS')/L1   ⍝ If it's defined,
 K←KEEPUS              ⍝    get the value
L1:→(~∨/'{}'∊A)/L2
 ⍙OUT'Warning:  The APL2ASCII argument contains braces.  Check the'
 ⍙OUT'result to make sure it has not been transliterated twice!'
 ⍙OUT'If it has, you can use ASCII2APL to restore it.'
L2:→(2≠P←⍴⍴A)/L3       ⍝ If arg is a matrix,
 A←⍙TCNL ⍙MTOV A       ⍝    convert to vector
L3:→K/L4               ⍝ If KEEPUS=0,
 A←⍙DEDUBL A           ⍝    change ASCII synonyms to APL chars
L4:S←⍙TTABX[;1]        ⍝ chars to replace
 R←0 2↓⍙TTABX          ⍝ replacement strings
 W←+/R≠' '             ⍝ width of each replacement
 I←S⍳A
 ⍝ Guess which symbols are dyadic (1=dyadic, 0=monadic):
 D←(¯1↓' ',A)∊'''.)]0123456789_∆⍙⎕⍞',,⍙ALPHS
 D←D∨(1↓A,' ')∊'/\⌿⍀'  ⍝ force dyadic if next is reduce/scan
 I←I+D∧A=(S,'  ')[I+D] ⍝ use 2nd keyword (if there is one) for dyadic
 N←(W,1 1)[I]          ⍝ width of each input char in output
 B←(¯1↑M←+\N)⍴0
 B[M]←1                ⍝ 0s mark places where new space is needed
 Z←B\A                 ⍝ insert space for phrases
 C←I≤⍴S                ⍝ 1s mark input chars to replace
 X←,R[C/I;]            ⍝ replacement for each char
 X←(X≠' ')/X           ⍝ sans blanks
 B[C/M]←0              ⍝ put 0 in posn for last char of each replacement
 Z[(~B)/⍳⍴B]←X         ⍝ insert replacements
 →(3≠1↑⍴⍙ALPHS)/L5     ⍝ If this APL has three alphabets,
 Z←K ⍙USLTOASC Z       ⍝    transliterate the third case
L5:→(P≠2)/0
 Z←⍙VTOM Z             ⍝ restore original rank
 ⍝ Copyright (c) 1994-95 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
