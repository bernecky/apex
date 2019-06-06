 ⍙Z←INSERTFNS ⍙A;⍙C;⍙F;⍙G;⍙H;⍙I;⍙J;⍙K;⍙N;⍙R;⍙S;⍙T;⍙W;⍙NOUNWRAP;⎕IO
 ⍝Inserts function/variable listings into message ⍵, and transliterates it
 ⍝ Arguments:
 ⍝    ⍙A  - message into which function definitions should be inserted.
 ⍝          May be either a character matrix or newline-delimited vector.
 ⍝          Lines in the message that begin with "∇name" are replaced
 ⍝          with the function or variable's definition.
 ⍝ ⍙PGWID - (global) the page width to use in wrapping the result,
 ⍝          optionally followed by the continuation indent.
 ⍝          (E.g., ⍙PGWID←78 3)
 ⍝  ⍙QIO  - (optional global) the value of ⎕IO outside this function.
 ⍝          (Referenced only if ⎕IO is inserted.)
 ⍝ Result:
 ⍝    ⍙Z  - the expanded message.  Has the same form (matrix or vector)
 ⍝          as the argument.  The entire text, both existing text and
 ⍝          inserted function listings, is transliterated to ASCII.
 ⍝          Long lines in function and variable listings are wrapped,
 ⍝          but long lines in the rest of the text are not.
 ⍝
 ⎕IO←1
 ⍙W←2↑⍙PGWID,3                  ⍝ page width and continuation indent
 ⍙R←⍴⍴⍙Z←⍙A
 →(⍙R=2)/⍙1
 ⍙Z←⍙VTOM ⍙TCNL,⍙Z              ⍝ convert vector to matrix
⍙1:⍙T←(~⎕AV∊32↓127↑⍙ASCII)/⎕AV  ⍝ non-ASCII characters
 →(~∨/⍙T∊⍙Z)/⍙2                 ⍝ If msg isn't all ASCII,
 ⍙Z←APL2ASCII ⍙Z                ⍝    transliterate it
⍙2:⍙A←((1↑⍴⍙Z),¯1+1↓⍴⍙TTABM)↑⍙LJUST ⍙Z
 ⍙NOUNWRAP←1                    ⍝ prevent ASCII2APL from unwrapping lines
 ⍙S←⍙MUTE'⍙A←ASCII2APL ⍙A'      ⍝ get first few characters of each row
 ⍝ ↑ Use ⍙MUTE to prevent warnings caused by chopped keywords
 ⍙NOUNWRAP←0                    ⍝ turn line unwrapping on
 ⍙A←((1↑⍴⍙A),2)↑⍙A              ⍝ need only 1st 2 cols
 ⍙J←⍙J/⍳⍴⍙J←⍙A[;1]='∇'          ⍝ rows to insert fns/vars
 ⍙J←(⍙A[⍙J;2]≠':')/⍙J           ⍝ skip rows that start with ∇:
 →(0=⍴⍙J)/⍙12                   ⍝ quit if nothing to insert
 ⍙F←0 1↓ASCII2APL ⍙LJUST ⍙Z[⍙J;]⍝ the fn/var names
 ⍙F←0 1↓(⍙F[;1]='.')⌽' ',⍙F     ⍝ delete . which may have followed ∇
 ⍙I←1+''⍴⍴⍙J
⍙3:→(0=⍙I←⍙I-1)/⍙12             ⍝ Loop for each insertion (last to first)
 ⍙H←⍙G←(⍙G≠' ')/⍙G←⍙F[⍙I;]      ⍝    the object name
 →(∨/≠⌿⍙TOLOWER'⎕IO ',[0.5]4↑⍙G)/⍙5 ⍝    If the object is ⎕IO,
 ⍝ ↑ Careful here--DEFINEFNS may change the case of ⎕IO
 →(2=⎕NC'⍙QIO')/⍙4              ⍝       If ⍙QIO isn't defined, warn user
 ⍙OUT'Warning!  ⎕IO is shadowed; global value inaccessible.  Exported as 1.'
 →⍙7                            ⍝       Else,
⍙4:⍙H←'⍙QIO'                    ⍝          get value from ⍙QIO, not ⎕IO
 →⍙7                            ⍝    Endif
⍙5:→('⎕'=1↑⍙G)/⍙7               ⍝    assume variable if starts w. ⎕
 →(0 2 3=⎕NC ⍙G)/⍙6,⍙7,⍙8
 ⍝ ↑ Note: On some systems (e.g., Dyalog) ⎕NC does not return 4 for
 ⍝   quad names, so we handle them separately.
 ⎕←'Unable to insert ',⍙G,' (wrong name class).'
 →⍙3
⍙6:⎕←'Unable to insert ',⍙G,' (not defined).'
 →⍙3
⍙7:⍙C←⍙G ⍙FMTVAR⍎⍙H            ⍝    the var defn
 ⍝ ↑ Usually ⍙H is the same as ⍙G, except when ⍙G is '⎕IO'
 →⍙10
⍙8:⍙C←⎕CR ⍙G                    ⍝    the fn defn
 →(~0∊⍴⍙C)/⍙9
 ⎕←'Unable to insert ',⍙G,' (locked function).'
 ⍙C←APL2ASCII'     ⍫ ',⍙G       ⍝    "list" it as ⍫fnname
 ⍝ ↑ This is done so DEFINEFNS won't see ∇NAME and define an empty fn
 ⍙C←(1,⍴⍙C)⍴⍙C                  ⍝    code below expects a matrix
 →⍙10
⍙9:⍝⍝⍝⍝ARGHH ⍙N←⍕((1↑⍴⍙C),1)⍴¯1+⍳1↑⍴⍙C    ⍝    line numbers
⍝⍝⍝⍝⍝ARGGH  ⍙N←'[',⍙LJUST(⍙RJUST ⍙N),']'   ⍝    in brackets
⍝⍝⍝⍝⍝ARGGH  ⍙N←((1↑⍴⍙N),6)↑⍙N
⍝⍝⍝⍝⍝ARGGH  ⍙N[1;]←(-1↓⍴⍙N)↑'∇'            ⍝    replace [0] with ∇
⍝⍝⍝⍝⍝ARGGH  ⍙C←⍙N,⍙C                       ⍝    add the line numbers
⍝⍝⍝⍝⍝ARGGH  ⍙C←⍙C,[1](1↓⍴⍙C)↑⍙N[1;]        ⍝    put closing ∇ at bottom
 ⍙S←⍙MUTE'⍙C←APL2ASCII ⍙C'      ⍝    transliterate
 ⍙C←⍙W ⍙WRAPLNS ⍙C              ⍝    limit line length
⍙10:⍙K←⍙J[⍙I]                   ⍝    row in msg to replace
 →(⍙K=1↑⍴⍙Z)/⍙11                ⍝    jump if at end of msg
 →(⍙Z[⍙K+1;]∧.=' ')/⍙11         ⍝    If next line in msg isn't blank,
 ⍙C←⍙C,[1]' '                   ⍝       add a blank line
⍙11:⍙Z←(((⍙K-1),1↓⍴⍙Z)↑⍙Z)⍙OVER ⍙C ⍙OVER(⍙K,0)↓⍙Z ⍝    insert the listing
 →⍙3                            ⍝ Endloop
⍙12:→(⍙R=2)/0
 ⍙Z←1↓⍙TCNL ⍙MTOV ⍙Z            ⍝ restore original rank
 ⍝ Copyright (c) 1994-5 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
