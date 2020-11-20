 Initialize Options
     ⎕IO←0 ⍝ Everyone's index origin
 ⍝ Establish various globals
     InitializeAST
     InitializeSSA
     A1←'abcdefghijklmnopqrstuvwxyz'
     A2←'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     digits←'0123456789'
     stname←0  ⍝ Name of symbol table item
     stclass←1 ⍝ Symbol table item class
     stscope←2 ⍝ Symbol table item scope
 ⍝ stscope values are astscope values
     NullChar←⎕AV[0]
     NULL←E ¯1
     asttypeB←E 0 ⋄ asttypeI←E 1 ⋄ asttypeD←E 2
     asttypeZ←E 3 ⋄ asttypeC←E 4 ⋄ asttypeJ←E 5
 ⍝ Following two sets of types must be kept in synch
     Types←'bidzcx'
     TypesBig←'BIDZCX' ⍝ X always last in all 4 of these.
     TypesSISAL←(E'boolean'),(E'integer'),(E'double_real'),(E'complex'),E'character'
     TypesSISAL←TypesSISAL,E'NONE'
     TypesSAC←(E'bool'),(E'int'),(E'double'),(E'complex'),E'char'
     TypesSAC←TypesSAC,E'NONE'
     dfnrarg←1+dfnlarg←1+dfnres←1+dfnname←0 ⍝ Fixed ast row defns
     aststz←E' END' ⍝ Marks end of names&constants in ast.
 ⍝ This value can't appear in ast[;asttarget] elsewhere.
 ⍝ System fns and varbs
     systemfns←(E'⎕fi'),(E'⎕vi'),(E'⎕map')
     sysQQ←(E'⍞'),E'⎕'
     systemvars←(E'⎕io'),(E'⎕pp'),(E'⎕pw'),(E'⎕ct'),(E'⎕rl'),(E'⎕wa')
     systemnfns←(E'⎕ts'),E'⎕av'    ⍝ Niladic system fns
 ⍝ misc constants
     CR←TCNL
     LF←TCLF
     TAB←⎕AV[9]
     DAPLVER←'Dyalog of some flavor'
