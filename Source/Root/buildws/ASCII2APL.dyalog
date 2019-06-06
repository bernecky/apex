 Z←ASCII2APL A;D;I;J;K;L;M;P;R;U;⎕IO
 ⍝Translates ASCII phrases to APL symbols in message ⍵
 ⍝ Arguments:
 ⍝       A   - the message, either a character matrix or
 ⍝             newline-delimited vector
 ⍝   ⍙TTABM  - (global) translate table created by MAKETTAB
 ⍝ ⍙NOUNWRAP - (optional global)  If ⍙NOUNWRAP=1, line unwrapping is
 ⍝             bypassed.  If it's 0 or undefined (the usual condition),
 ⍝             line unwrapping is performed.
 ⍝ Result:
 ⍝       Z   - message with APL characters restored.
 ⍝             Has the same representation (matrix or vector) as the arg.
 ⍝
 ⎕IO←1
 →(2≠D←⍴⍴A)/L1             ⍝ If arg is a matrix,
 A←⍙TCNL ⍙MTOV A           ⍝    convert to vector
L1:→(0=⎕NC'⍙NOUNWRAP')/L2  ⍝ unwrap if ⍙NOUNWRAP is undefined
 →⍙NOUNWRAP/L3             ⍝ skip unwrapping if it's 1
L2:A←⍙UNWRAPLNS A          ⍝ combine continuation lines
L3:A←⍙USLTOAPL A           ⍝ translate {A_}{B_}{C_} to 3rd or 2nd alphabet

 ⍝ Translate the special single characters to APL (e.g., <poundsign> → ⎕)
 I←(⍙TTABM[;3]≠'{')/⍳1↑⍴⍙TTABM ⍝ rows for special chars
 J←J/⍳⍴J←A∊⍙TTABM[I;3]     ⍝ find special chars in the input
 J←(A[1⌈J-1]≠'{')/J        ⍝ not preceded by {
 K←⍙TTABM[I;3]⍳A[J]        ⍝ look 'em up
 A[J]←⍙TTABM[I[K];1]       ⍝ replace 'em with APL symbols

 ⍝ Translate the multi-character phrases
 L←L/⍳⍴L←A='{'             ⍝ indices of keyword starts
L4:P←L∘.+¯1+⍳1↓⍴⍙TTABM     ⍝ indices where keywords occur
 M←(A,' ')[P⌊1+⍴A]         ⍝ the {keywords} and beyond
 P←0 ¯1↓1,∧\M≠'}'          ⍝ 1s mark the {keyword} part, 0s beyond
 M←(⍴M)⍴(,P)\(,P)/,M       ⍝ blank out stuff past the }
 U←M←(∨⌿P)/M               ⍝ delete trailing blank columns
 R←+/P                     ⍝ width of each keyword
 K←''⍴(~⎕AV∊M)/⎕AV         ⍝ pick a char not found in M
 M←K ⍙MTOV M
 ⍝ Remove imbedded blank, _, and -, but not those next to { or }:
 M←((~M∊' _-')∨('{'=¯1⌽M)∨'}'=1⌽M)/M
 ⍝ (We must leave {->}, {delta_}, etc. unchanged.)
 M←⍙TOLOWER ⍙VTOM M        ⍝ allow uppercase keywords
 I←(0 2↓⍙TTABM)⍙MATIOTA M  ⍝ look up keywds in msg
 →(~0∊I)/L5                ⍝ If any were not found,
 P←(I=0)⌿U                 ⍝    get the phrases (as originally found in text)
 P←((P ⍙MATIOTA P)=⍳1↑⍴P)⌿P⍝    remove duplicates
 ⍙OUT'Warning--unrecognized keywords:'
 ⍙OUT' '⍙MTOV' ',P         ⍝    inform the user
 L←(I≠0)/L                 ⍝    ignore { for unrecognized phrases
 →L4                       ⍝    restart this phase
L5:A[L]←⍙TTABM[I;1]        ⍝ replace { with the APL symbol
 P←(1+⍴A)⍴1
 P[(L+1),L+R]←0            ⍝ put 0s to the right of { and }
 Z←(=\¯1↓P)/A              ⍝ remove the keyword} part
 →(D≠2)/0
 Z←⍙VTOM Z                 ⍝ restore original rank
 ⍝ Copyright (c) 1994-95 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
