 Initialize Opts
 ⎕IO←0 ⍝ Everyone's index origin
 ⍝ Establish various globals
 InitializeSSA
 InitializeST
 InitializeTYPES
 A1←'abcdefghijklmnopqrstuvwxyz'
 A2←'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
 Digits←'0123456789'
 NullChar←⎕AV[0]
 NULL←E ¯1
 asttypeB←E 0 ⋄ asttypeI←E 1 ⋄ asttypeD←E 2
 asttypeZ←E 3 ⋄ asttypeC←E 4 ⋄ asttypeJ←E 5
 dfnrarg←1+dfnlarg←1+dfnres←1+dfnname←0 ⍝ Fixed ast row defns
 aststz←E' END' ⍝ Marks end of names&constants in ast.
 ⍝ This value can't appear in ast[;asttarget] elsewhere.
 ⍝ System fns and varbs
 sysfns←(E'⎕fi'),(E'⎕vi'),(E'⎕map')
 sysnfns←,(E'⎕ts'),(E'⎕wa'),E'⎕av' ⍝ Niladic system fns
 sysvars←(E'⎕io'),(E'⎕pp'),(E'⎕pw'),(E'⎕ct'),(E'⎕rl')
 sysconsts←'' 
 sysQQ←(E'⍞'),E'⎕'
 InitializeGlobals Opts ⍝ Maybe can inline this?
