 ⍙Z←⍙LOADSUB ⍙F;⍙B;⍙C;⍙E;⍙I;⍙J;⍙L;⍙N;⍙P;⍙Q;⍙S;⍙T;⍙X;⍙NOUNWRAP;⎕IO
 ⍝Reads transliterated files ⍵, defining objects in the workspace
 ⍝ MODIFIED by R. Bernecky 1996-12-10
 ⎕IO←1
 ⍙OUT'Reading...'

 ⍙F←0 0⍴''                  ⍝ names of objects we defined
 ⍙I←0
⍙1:→(⍙L≤⍙I←⍙I+1)⍴⍙3        ⍝ Loop for each file
 ⍙X←tfread ⍙F,⍕⍙I
 ⍙X←⍙X~⎕TCNL ⋄ ⍙X[(⍙X=⎕TCLF)/⍳⍴⍙X]←⎕TCNL  ⍝    convert delimiter to NL
 ⍙X←⍙X,(⍙L≤⍙I+⍙Q)/⎕TCNL      ⍝    implicit last line at end of file
 ⍙X←⍙P,⍙X                   ⍝    add partial line from previous block
 ⍙P←(-(⌽⍙X)⍳⎕TCNL)↑⍙X       ⍝    partial last line in this block
 ⍙B←⍙B ⍙OVER ⍙LJUST ⍙VTOM(-⍴⍙P)↓⍙X⍝   append whole lines to buffer
 ⍙X←0                       ⍝    reclaim storage
 ⍙C←((1↑⍴⍙B),3⌈¯1+1↓⍴⍙TTABM)↑⍙B
 ⍙NOUNWRAP←1                ⍝    prevent ASCII2APL from unwrapping lines
 ⍙S←⍙MUTE'⍙C←ASCII2APL ⍙C'  ⍝    get the first few symbols on each line
 ⍝ ↑ Use ⍙MUTE to suppress error messages from chopped keywords
 ⍙NOUNWRAP←0                ⍝    turn unwrapping on
 →(0∊⍴⍙C)/⍙1                ⍝    read more if nothing
 ⍙S←(((1↑⍴⍙C),3)↑⍙C)∧.='[0]'⍝    find [0] starts
 ⍙S←⍙S∨⍙C[;1]='∇'           ⍝    find ∇ starts
 ⍙E←⍙S∨⍙C[;1]=' '           ⍝    find ends
⍙2:⍙J←⍙S⍳1                  ⍝    Loop for each defn in the block
 →(~1∊⍙J↓⍙E)/⍙1             ⍝       quit if end isn't in the block
 ⍙N←(⍙J↓⍙E)⍳1               ⍝       num lines in defn
 ⍙X←⍙B[⍙J+¯1+⍳⍙N;]          ⍝       the defn
 ⍙N←⍙J+⍙N-⍙C[⍙J;2]∊'.:-'    ⍝       num lines to drop--exclude end if not a fn
 ⍙B←(⍙N,0)↓⍙B               ⍝       drop the defn
 ⍙C←(⍙N,0)↓⍙C               ⍝       and related info
 ⍙S←⍙N↓⍙S
 ⍙E←⍙N↓⍙E
 ⍙F←⍙F ⍙OVER DEFINEFNS ⍙X   ⍝       define the object
 ⍙X←0                       ⍝       reclaim storage
 →⍙2                        ⍝    Endloop
⍙3:⎕NUNTIE ⍙T               ⍝ Endloop
 →(~0∊⍴⍙F)/⍙4
 ⍙Z←'No objects were found in the file.'
 →0
⍙4:⍙Z←'The following objects were defined:'
 ⍙Z←⍙Z ⍙OVER' ',' ',(⎕PW-2)⍙TELPRINT ⍙F
 →0 ⋄ ASCII2APL ⍝ accessed thru ⍎
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
