 r←tokenize y;b;i;j;k;tv;t;tc;m;p;ps;d;rho;bor
 ⍝ Tokenize the function whose ⎕cr is y, to give
 ⍝ a character matrix of shape ⍴y,
 ⍝ with tokenization values
 ⍝ for each symbol.
 y←' ',y,' ' ⍝ Simplify edge conditions
 rho←⍴y
 clsinit
 bor←(×/rho)⍴(¯1↑⍴y)↑1 ⍝ Mark start of each row
 i←InQuotes y
 b←~i
 r←,('?',clschar)[i]

 i←,InComment y
 b←(,b)∧~i
 y←,y
 r[i/⍳⍴i]←clslamp

 ⍝ Control Structures
 i←b tokenizeDyalog y ⋄ b←b∧~i ⋄ r[i/⍳⍴i]←clsctl

 ⍝ Primitive fns and all other 1-element tokens
 tv←'+-×÷<≤=≥>≠≡*⍟∨∧⍪∊⍷⍴⊖~⍉↑↓⍳⌈⌊⍱⍲⍒⍋⌹€⊣⊂⊃∩∪⊤⊥⍕⍎|⌽,?○∘≢⌶⊢⊣⌷'
 tc←(⍴tv)⍴clsfn ⍝ Fn token class

⍝ Space, assign, adverbs
 tv←tv,' ←/\⌿⍀¨&'
 tc←tc,clsspace,clsassign,6⍴clsadverb

⍝ Conjunctions
 tv←tv,'Öö⍣⌺⍤'
 tc←tc,5⍴clsconj

⍝ Brackets, labels, colon, semicolon, diamond, goto, curly braces
 tv←tv,'[]():;⋄ →{}'
 tc←tc,clslbr,clsrbr,clslpar,clsrpar,clscolon,clssemic,clssep,clsgoto,clslbr,clsrbr

 i←b∧y∊tv
 r[i/⍳⍴i]←tc[tv⍳i/y]
 b←b∧~i

 ⍝ Conjunctions
 i←(r='?')∧(y='.')∧(clsfn=1⌽r)∧clsfn=¯1⌽r
 r[i/⍳⍴i]←clsconj
 b←b∧~i

 ⍝ Identifiers.
 b←b∧~i←b∧y∊'⍺⍵'
 r[i/⍳⍴i]←clsid
 ⍝ Quad and quote-quad
 i←(y∊'⎕⍞')∧(r='?')∧~1⌽y∊#.globals.A1,#.globals.A2
 r[i/⍳⍴y]←clsqq

 ⍝ Ids: letter,{letter|digit|underbar|overbar}
 i←r='?'
 ps←i/i>¯1⌽i ⍝ Partition starts
 d←i/y ⍝ Putative ids
 j←ps∧d∊#.globals.A1,#.globals.A2,'∆⍙⎕_' ⍝ First char in ID
 k←(~ps)∧d∊#.globals.A1,#.globals.A2,'∆⍙_',#.globals.Digits ⍝ Other chars in ID
 j←ps\ps pandreduce j∨k ⍝ Valid IDs
 j←ps #.arrayutils.pmaxscan j+ps∧d='⎕' ⍝ System verbs and fns
 r[(i\×j)/⍳⍴r]←('_',clsid,clsqdnm)[(j≠0)/j]

 ⍝ Numeric constants.
 i←r='?'
 ps←i/i>¯1⌽i ⍝Partition starts.
 d←i/y ⍝ Putative numeric constants.
 j←ps #.arrayutils.pmaxscan ps\ps pandreduce d∊#.globals.Digits,'.eEjJ¯ '
 r[(i\j)/⍳⍴r]←clsnum

 ⍝ Build numeric vector constants.
 ⍝ Partitions start with numeric constant,
 ⍝ continue through spaces and numeric constants
 ⍝ End at end of each row
 j←r=clsnum ⍝ Partition starters
 j←j pandscan(r∊clsnum,clsspace)∧~bor
 j←j∧,∨\~rho⍴j  ⍝ Leading spaces don't count
 r[j/⍳⍴j]←clsnum
 ⍝ Tidy up trailing blanks in each row
 j←,⌽∧\⌽' '=rho⍴y
 r[j/⍳⍴j]←clsspace
 r←0 1↓0 ¯1↓rho⍴r
