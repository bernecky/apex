 Z←⍙GETVAL C;D;E;I;J;L;Q;R;S;X
 ⍝Extracts value from formatted representation ⍵
 ⍝ C is a character vector containing the portion of the transfer
 ⍝   form to the right of the assignment arrow.  (In APL form.)
 ⍝ Sets global variable ⍙ERR to a character vector error message if the
 ⍝   value couldn't be extracted, or to '' if there was no problem.
 ⍝
 Z←S←0 0⍴0            ⍝ no-shape-found indicator
 →(' '≠1↑C)/L1
 C←⍙DLB C             ⍝ delete leading blanks, only if necessary
L1:→(~(1↑C)∊'0123456789')/L2 ⍝ If the value starts with a digit,
 J←1↑I←C⍳'⍴⊂('''      ⍝    check for shape
 →(J∨.≥1↓I)/L2        ⍝    If ⍴ occurs before ⊂ ( or ',
 S←⍙XNUMS(J-1)↑C      ⍝       get the shape
 →(0≠⍴⍙ERR)/0
 C←J↓C                ⍝       drop it from the value
 →(' '≠1↑C)/L2
 C←⍙DLB C
L2:→('⊂('''=1↑C)/L4,L4,L3 ⍝ jump if nested or character type
 Z←⍙XNUMS C           ⍝ get numbers
 →(0≠⍴⍙ERR)/0
 →L7
L3:→(' '≠¯1↑C)/L10
 C←⍙DTB C             ⍝ drop any blanks past closing quote
L10:Q←≠\C=''''
 ⍙ERR←'improperly quoted string'
 →(~(~¯1↑Q)∧∧/Q∨¯1↓1,Q)/0
 Z←1↓Q/C              ⍝ get character value
 →L7

 ⍝ Recurse on nested value
L4:⍙ERR←'nested/heterogeneous array'
 →('APLPLUS1'∧.=8↑⍙APLVER)/0 ⍝ no nested arrays on APL*PLUS/PC
 →('APL68K'∨.≠6↑⍙APLVER)/L5
 →(⍙LEVEL=1)/0        ⍝ or on APL.68000 Level I
L5:→('⊂'≠1↑C)/L12     ⍝ If it has the form ⊂xxx,
 R←(⍴C)+L←,1          ⍝    drop ⊂ in the loop below
 →L11                 ⍝    jump ahead
L12:Q←=\C≠''''        ⍝ 0s mark literals
 L←Q∧C='('            ⍝ 1s mark left parens outside of quotes
 R←Q∧C=')'            ⍝ right parens
 D←+\L-R              ⍝ depth of parenthesis nesting
 ⍙ERR←'unbalanced parentheses'
 →((D∨.<0)∨0≠¯1↑D)/0
 L←(L∧D=1)/⍳⍴L        ⍝ indices of top-level (s
 R←(R∧D=0)/⍳⍴R        ⍝ indices of top-level )s
 →(1≠⍴L)/L11          ⍝ If it has the form (xxx),
 Z←⍙GETVAL L↓(R-1)↑C  ⍝    return xxx
 →(0≠⍴⍙ERR)/0
 →L7
L11:X←'⊂<'[1+'IPSA'∧.=4↑⍙APLVER],'Q' ⍝ <Q for Sharp, ⊂Q for others
 I←Q←0
 Z←(E←⍴L)⍴⍎X
L6:→(E<I←I+1)/L7      ⍝ Loop for each nested item
 Q←⍙GETVAL L[I]↓(R[I]-1)↑C ⍝    extract the value between ( )s
 →(0≠⍴⍙ERR)/0         ⍝    give up if a problem's been found
 Z[I]←⍎X              ⍝    enclose and store it
 →L6                  ⍝ Endloop

 ⍝ Establish the correct shape
L7:→(2=⍴⍴S)/L8        ⍝ If an explicit shape was found,
 ⍙ERR←'item count wrong for shape'
 →(~(⍴Z)∊0,1⌈×/S)/0   ⍝    make sure element count is correct
 →L9                  ⍝ Else,
L8:S←(1≠⍴Z)/⍴Z        ⍝    scalar if singleton, else vector
L9:Z←S⍴Z
 ⍙ERR←''              ⍝ indicate success
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
