 r←x SSASearchRenameNonPhi yy;ast;X;cv;tar;y;S;m;b;p;j;n;q;i;k
 ⍝ SSA Search from Wolfe 1992, p. 183
 ⍝ This only handles ONE target verb, tar
 X←D x[0] ⋄ tar←D x[1] ⍝ Vars,target varb
 y←D yy[0] ⍝ SSA Stuff
 S←D yy[1]⍝ S is rename stack.
 ⍝   yy[2]    is available name list.
 ast←D y[ssaast]
 cv←bb BBn X ⋄ b←cv⌿ast ⍝ The bb of interest
⍝ (2) Rename all non-phi uses in node X
 ⍝ We have to use the S member that preceeds sets
 ⍝ of the appropriate member of S.
 m←cv\~b[;astfn]∊E':PHI' ⍝ No PHI fns
 j←(m⌿ast)[;k←astlarg,astlop,astrop,astrarg]
 p←,j∊tar
 n←p/⍳⍴p
 r←y
 :If 0≠⍴n
  ⍝ We want to get the Nth element of S,
  ⍝ where N is 0 for last set, 1 for penultimate set, etc
  ⍝ Indexed assign uses before set.
  ⍝ NB. The set has been renamed, hence tar,S rather than tar
     i←(cv⌿ast)[;asttarget]∊tar,S ⍝ Sets in bb
     i←i∧~(cv⌿ast)[;astfn]∊E':For' ⍝ Not a "real" set
     q←⌽+\⌽i ⍝ The S index desired
     p←p∧,⍉(⌽⍴j)⍴q
     p←S[p[n]]
     j←,j
     j[n]←p
     j←((+/m),⍴k)⍴j
⍝  'oops'assert isnum j
     ast[m/⍳⍴m;k]←j
     r[ssaast]←E ast
 :EndIf
 r←(E r),(E S),yy[2]
