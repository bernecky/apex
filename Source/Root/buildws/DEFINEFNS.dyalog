 ⍙Z←DEFINEFNS ⍙M;⍙C;⍙E;⍙F;⍙G;⍙H;⍙I;⍙K;⍙N;⍙R;⍙S;⍙T;⍙V;⍙W;⍙ERR;⍙NOUNWRAP;⎕IO
 ⍝Defines functions and variables found in message ⍵
 ⍝ Arguments:
 ⍝   ⍙M  - the transliterated message from which function/variable
 ⍝         definitions should be extracted.  May be either a character
 ⍝         matrix or a newline-delimited vector.
 ⍝  ⍙QIO - (optional global)  If this var is defined, any value of ⎕IO
 ⍝         found in the message will be assigned to ⍙QIO.  If it isn't
 ⍝         defined, ⎕IO will be placed in one of the VARi variables.
 ⍝ Results:
 ⍝   ⍙Z  - character matrix containing the names of objects that
 ⍝         were defined in the workspace.
 ⍝  ⍙QIO - (global) value of ⎕IO found in the message.  (See above.)
 ⍝
 ⍝ A line that begins with either [0] or ∇ (as the first nonblank
 ⍝   character) marks the start of a definition in the message.
 ⍝ A line that begins with ∇. marks the start of a variable definition.
 ⍝ A line that begins with ∇: marks the start of a statement to execute.
 ⍝ A line that begins with ∇- marks a separator (start/end of WS, etc.)
 ⍝ A definition ends with a blank line, a closing ∇, or the end of the
 ⍝   message.
 ⍝
 ⍝ If a function can't be defined, its ⎕CR is placed in a global
 ⍝   variable CR<i> (where <i> is an integer).
 ⍝ If a variable can't be defined, its value is placed in a global
 ⍝   variable VAR<i>.
 ⍝
 ⎕IO←1
 ⍙Z←0 0⍴''
 →(~'∇'∊⍙M)/⍙1
 ⍙OUT'The DEFINEFNS argument must be in transliterated form.'
 →0
⍙1:→(2=⍴⍴⍙M)/⍙2                ⍝ If not a matrix,
 ⍙M←⍙VTOM ⍙TCNL,⍙M             ⍝    break on CRs
⍙2:⍙M←⍙LJUST ⍙M
 ⍙F←((1↑⍴⍙M),3⌈¯2+1↓⍴⍙TTABM)↑⍙M
 ⍙NOUNWRAP←1                   ⍝ prevent ASCII2APL from unwrapping lines
 ⍙T←⍙MUTE'⍙F←ASCII2APL ⍙F'     ⍝ get the first few symbols on each line
 ⍝ ↑ Use ⍙MUTE to suppress error messages from chopped keywords
 ⍙NOUNWRAP←0                   ⍝ turn line unwrapping on
 →(0∊⍴⍙F)/0
 ⍙F←(0 3⌈⍴⍙F)↑⍙F
 ⍙S←(⍙F[;1]='∇')∨⍙F[;⍳3]∧.='[0]' ⍝ find defn starts
 ⍙E←⍙S∨⍙F[;1]=' '              ⍝ and ends

⍙3:⍙I←⍙S⍳1                     ⍝ Loop for each object
 →(⍙I>⍴⍙S)/0                   ⍝    quit if no more objs
 ⍙N←(⍙I↓⍙E)⍳1                  ⍝    num lines in defn
 ⍙R←⍙C←⍙M[⍙I+¯1+⍳⍙N;]          ⍝    the defn
 ⍙C←⍙TCNL ⍙MTOV ⍙C             ⍝    work with it as a vector
 ⍙K←''
 ⍝ Convert to APL, and capture unrecognized-keyword messages:
 '⍙K←⍙MUTE''⍙C←ASCII2APL ⍙C'''⍙WITHTTM ⍙TTABM ⍙OVER ⍙TCNL,' {nl}'
 ⍝ ↑ We untransliterate objects one at a time because we don't want the
 ⍝   matrix ⍙M to become extremely wide from unwrapping the continuation
 ⍝   lines in long variable definitions.
 ⍙K←(⍙K⍳⍙TCNL)↓⍙K←(⍙K⍳⍙TCNL)↓⍙K ⍝    list of bad keywords, if any
 ⍙S[⍙I,(~(2↓3↑⍙C)∊'.:-')/(⍴⍙S)⌊⍙I+⍙N]←0 ⍝    mark this one as processed
 ⍝ ↑ If this object is a function, don't consider the ending line
 ⍝   (which may be a closing ∇) to be the start of an object.

 ⍝ ∇- prefix -- marker; check version number
 →('∇-'∨.≠1↓3↑⍙C)/⍙6
 ⍙C←⍙DLB(⍙C⍳' ')↓⍙C
 ⍙V←'APLASCII version:'
 →(⍙V∨.≠(⍴⍙V)↑⍙C)/⍙3           ⍝    skip all but version markers
 ⍙C←(⍴⍙V)↓⍙C
 ⍙C←1↑⍙XNUMS(¯1+⍙C⍳'(')↑⍙C     ⍝    version number in the argument
 ⍙N←1↑⍙XNUMS(¯1+⍙A2AVER⍳'(')↑⍙A2AVER ⍝    our version number
 →(⍙C=⍙N)/⍙3                   ⍝    done if versions are indentical
 →(⍙C>1.3)/⍙4                 ⍝    warn of v1.3 incompatibility
 ⍙OUT ⍙TCNL,'Warning:  This transliteration was produced using an old'
 ⍙OUT'version of APLASCII.  Certain nested arrays may not be received'
 ⍙OUT'correctly, possibly without producing any error message.'
 →⍙3                           ⍝    perhaps we should quit instead...
⍙4:→(⍙C<⍙N)/⍙5               ⍝    warn if argument is newer
 ⍙OUT ⍙TCNL,'Warning:  This transliteration was produced using a newer'
 ⍙OUT'version of APLASCII.  There may be compatibility problems.'
 ⍙OUT'You should obtain version ',(⍕⍙C),' of APLASCII and rerun this job.'
 →⍙3
⍙5:                           ⍝    arg is older, but not 1.3
 ⍝ For now, we assume that future versions will be upward compatible
 →⍙3

 ⍝ ∇: prefix -- execute a statement
⍙6:→('∇:'∨.≠1↓3↑⍙C)/⍙7
 ⍎3↓⍙C                         ⍝    If error, execute →⍙3 to restart
 →⍙3

 ⍝ ∇. prefix -- extract a variable definition
⍙7:→('∇.'∨.≠1↓3↑⍙C)/⍙15        ⍝    jump if not a variable
 ⍙N←(¯1+⍙C⍳'←')↑⍙C
 ⍙V←(1+⍴⍙N)↓⍙C                 ⍝    value portion of listing
 ⍙G←⍙N←(⍙N≠' ')/⍙N←3↓⍙N        ⍝    the variable name (drop NL and ∇.)
 ⍙V←⍙GETVAL ⍙V                 ⍝    the array value
 →(0≠⍴⍙ERR)/⍙13
 →(0=⍴⍙K)/⍙9                   ⍝    If any unrecognized keywords,
 →(1=⍴⍴⍙V)/⍙8                  ⍝       If non-vector,
 ⍙OUT ⍙TCNL,'Unrecognized keywords in non-vector variable ',⍙N,':'
 ⍙OUT ⍙K                       ⍝          it's a bad error
 →⍙14                          ⍝       Else, a vector,
⍙8:⍙OUT ⍙TCNL,'Warning--unrecognized keywords in variable ',⍙N,':'
 ⍙OUT ⍙K                       ⍝          just a warning this time, mister
⍙9:→('⎕'≠1↑⍙N)/⍙10              ⍝    If this is a quad variable,
 ⍙G←⍙N←0 ⍙QUADCASE ⍙N          ⍝       normalize the case
 →(0=⍙QVARS ⍙MATIOTA ⍙N)/⍙12    ⍝       err if not available on this APL
 →(∨/≠⌿⍙TOLOWER'⎕IO ',[0.5]4↑⍙N)/⍙11 ⍝       If the var is ⎕IO,
 →(2≠⎕NC'⍙QIO')/⍙12             ⍝          balk if we weren't called by LOADWS
 ⍙G←'⍙QIO'                     ⍝          assign ⎕IO value to surrogate
⍙10:→(~⎕EX ⍙G)/⍙12               ⍝    jump if assignment will likely fail
⍙11:⍎⍙G,'←⍙V'                   ⍝    define the var
 ⍝ ↑ ⍙G is usually the same as ⍙N, except when ⍙N is '⎕IO'
 →⍙22
⍙12:⍙H←⍙N                       ⍝    remember the original name
 ⍎(⍙N←⍙GENSYM'VAR'),'←⍙V'      ⍝    assign to surrogate
 ⍙OUT ⍙TCNL,'Unable to assign variable ',⍙H,'.  Value stored in ',⍙N,'.'
 →⍙22
⍙13:⍙OUT ⍙TCNL,'Unable to extract value of variable ',⍙N,' (',⍙ERR,').'
⍙14:⍎(⍙N←⍙GENSYM'VAR'),'←⍙R'   ⍝    save the untransliterated value
 ⍙OUT'Transfer form stored in variable ',⍙N,'.'
 →⍙22

 ⍝ ∇ prefix -- extract a function definition:
⍙15:⍙C←(2+2×'['=⍙C[2])↓⍙C      ⍝    drop initial newline and ∇ or [0]
 →('APLPLUS'∧.=7↑⍙APLVER)/⍙17  ⍝    APL*PLUS tolerates either case
 →('APL68K'∨.≠6↑⍙APLVER)/⍙16   ⍝    In APL.68000...
 →(⍙LEVEL>1)/⍙17               ⍝      Level II tolerates either case
⍙16:⍙C←0 ⍙QUADCASE ⍙C          ⍝    convert quad names to the primary case
⍙17:⍙C←0 ⍙EJCASE ⍙C            ⍝    convert E/J in nums to primary case
 ⍙H←(¯1+⍙C⍳⍙TCNL)↑⍙C           ⍝    header line
 ⍙C←(⍴⍙H)↓⍙C                   ⍝    rest of fn
 ⍙C←⍙VTOM ⍙C                   ⍝    as a matrix
 →(0∊⍴⍙C)/⍙19                  ⍝    jump if body is empty
 ⍙W←1++/∧\⍙C≠']'               ⍝    width of line number on each line
 ⍙W←⍙W×⍙C[;1]='['              ⍝    zero width for lines w/o numbers
 ⍙C←(-⍙W)⌽(⍴⍙C)↑⍙W⌽((⍴⍙C)+0,⌈/⍙W)↑⍙C ⍝    remove the line numbers
 ⍙C←⍙DLTB ⍙C                   ⍝    delete leading and trailing blank cols
 →(0∊⍴⍙C)/⍙19                  ⍝    careful--may be empty now
 →(∨/(⍙C[;1]=' ')∧⍙C∨.≠' ')/⍙18⍝    If no exdents,
 ⍙C←' ',⍙C                     ⍝       indent all lines
⍙18:→('APL68K'∨.≠6↑⍙APLVER)/⍙19⍝    If on APL.68000,
 ⍙C[(⍙C∧.=' ')/⍳1↑⍴⍙C;1]←'⍝'   ⍝       make blank line be comments
 ⍝ ↑ If we don't do this, APL.68000 deletes the blank lines
⍙19:⍙C←(' ',⍙DLTB ⍙H)⍙OVER ⍙C  ⍝    restore the header
 ⍙W←⍙FNNAME ⍙H                 ⍝    name of fcn (or operator)
 →(~⎕EX ⍙W)/⍙20                ⍝    erase first, in case defined as var
 ⍙N←⎕FX ⍙C                     ⍝    define as fn
 →(0≠1↑0⍴⍙N)/⍙21               ⍝    If ⎕FX failed,
⍙20:⍙N←⍙GENSYM'CR'             ⍝       available name
 ⍎⍙N,'←⍙C'                     ⍝       save the ⎕CR
 ⍙OUT ⍙TCNL,'Unable to define ',⍙W,'.  ⎕CR stored in variable ',⍙N,'.'
 →(0=⍴⍙K)/⍙22
 ⍙OUT'And, by the way, it contains the following unrecognized keywords:'
 ⍙OUT ⍙K
 →⍙22
⍙21:→(0=⍴⍙K)/⍙22
 ⍙OUT ⍙TCNL,'Warning--unrecognized keywords in ',⍙W,':'
 ⍙OUT ⍙K

⍙22:⍙Z←⍙Z ⍙OVER ⍙N             ⍝    remember what we defined
 →⍙3                           ⍝ Endloop

 ASCII2APL                     ⍝ accessed thru ⍎
 ⍝ Copyright (c) 1994-95 Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
