 Z←W ⍙WRAPLNS A;C;H;I;J;L;M;N;R;S;T;V;⎕IO
 ⍝Wraps long lines in ⍵ to a maximum of ⍺ columns
 ⍝ Arguments:
 ⍝    A  - text whose long lines should be wrapped.  May be a
 ⍝         character matrix or newline-delimited vector.
 ⍝  W[1] - maximum width for an output line.
 ⍝  W[2] - optional indent used for continuation lines.  The default
 ⍝         is zero.
 ⍝ Result:
 ⍝    Z  - text with no line wider than W[1] columns.  Has the same
 ⍝         form (matrix or vector) as the argument.
 ⍝
 Z←A
 →0 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝ KILL!!!
 ⎕IO←1
 N←0⌈(W,0)[2]         ⍝ continuation indent
 W←''⍴W               ⍝ page width
 →(W>N+4)/L1
 ⎕←'Page width is too narrow'
 →0                   ⍝ exit without result
L1:H←20⌊W-N+1         ⍝ num chars to look back for cut point
 ⍝ V is all the characters considered 'letters' (may be part of a name):
 V←'}{0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_∆⍙⎕'
 R←⍴⍴Z←A
 →(R=2)/L2
 Z←⍙VTOM ⍙TCNL,Z      ⍝ convert vector to matrix
L2:J←J/⍳⍴J←((0,W)↓Z)∨.≠' ' ⍝ indices of long lines
 I←1+''⍴⍴J
L3:→(0=I←I-1)/L6      ⍝ Loop for each long line, last to first
 L←⍙DTB Z[J[I];]      ⍝    the line
 ⍝ Form C, in which 0s mark chars that can be the last on a line:
 C←(L∊V)∨≠\L∊'{}'     ⍝    1s mark words and {phrases}
 C←C∧L≠'}'            ⍝    zero out }s
 C←C∧'{'≠1↓L,' '      ⍝    zero out chars to left of {
 M←0 0⍴''
L4:T←W-2              ⍝    max that can be put on this line
 →(~C[T])/L5          ⍝    If max would split a name,
 S←¯1+(⌽(-H)↑T↑C)⍳0   ⍝       look for a good place to cut
 T←T-S×S≠H            ⍝       back up to avoid breaking a word
 →(T>N+2)/L5          ⍝       If this results in nothing,
 T←W-2                ⍝          take max to avoid infinite loop
L5:M←M ⍙OVER(T↑L),'{+'⍝    output a line
 L←((-N+2)↑'+}'),T↓L  ⍝    remaining text
 C←((N+2)⍴1),T↓C      ⍝    remaining break points
 →(W<⍴L)/L4           ⍝    repeat if the rest is still long
 M←M ⍙OVER L          ⍝    add final short line
 T←⍙DTB((J[I]-1),1↓⍴Z)↑Z ⍝    stuff above the current line
 Z←⍙DTB(J[I],0)↓Z     ⍝    stuff below the line
 ⍝ ↑ The ⍙DTBs are needed in case the argument is one VERY long line.
 ⍝   Without them, we might try to create, e.g., a 200-by-20000 matrix.
 Z←T ⍙OVER M ⍙OVER Z  ⍝    replace the line we just wrapped
 M←T←0                ⍝    reclaim storage
 →L3                  ⍝ Endloop
L6:→(R=2)/0
 Z←1↓⍙TCNL ⍙MTOV Z    ⍝ restore original rank
 ⍝ Copyright (c) 1994 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
