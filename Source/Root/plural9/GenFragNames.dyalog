 r←GenFragNames ast;i;j;k;fns;cv;lt;rnks
 ⍝# Generate function names for all fns to be called by genned code
 i←⍴j←ast[;astlop,astfn,astrop] ⍝ Derived fn names
 j←,j
 j[((isnum j)∨j∊NULL)/⍳⍴j]←E''
 fns←i⍴jsym j
 fns←((1↑⍴fns),fnscols)↑fns
 k←(~dfainit ast)∧~astclass∊NULL ⍝ Rank and type specification
 lt←ast[;astlarg,astrarg]
 lt←ast[0⌈lt;asttype],ast[;,asttype]
 lt[k/⍳⍴k;]←NULL
 fns[;fnstypes]←ER1 UC TYPES D lt
 k←~dfainit ast
 rnks←ast[;astlarg,astrarg]
 rnks←ast[0⌈rnks;astrank],ast[;,astrank]
 rnks[k/⍳⍴k;]←NULL
 fns[;fnsranks]←mcb ER1 RANKS rnks ⍝ Ranks
 k←dfainit ast
 cv←k∧(isnum ast[;astfn])∧~ast[;astfn]∊NULL ⍝ Defined fns
 i←,D(cv⌿ast)[;astfn]
 fns[cv/⍳⍴cv;fnslop]←ast[i;asttarget]
 ⍝
 ⍝ Kludge for CommandLineArgv
 cv←ast[;astfn]∊E'CommandLineArgv'
 fns[cv/⍳⍴cv;fnsfn]←cv/ast[;astfn]
 ⍝ Now append calling info.
 i←lt[;0]≠¯1 ⍝ Dyadics
 j←((E''),E'$XV,')[i] ⍝ Left arg
 fns[;fnslpar]←E'('
 fns[;fnslarg]←j
 fns[;fnsrarg]←E'$YV' ⍝ Right arg
 fns[;fnsrpar]←E')' ⍝ Closing paren eases semi-global handling
 fns[;fnsspec]←E,'.'              ⍝ No special cases yet
 ⍝ Gen temp names for derived fns w/non-primitive operands
 i←ast[;astlop,astfn,astrop]
 j←~ast[;astfn]∊,¨E¨'[]\⍀/⌿' ⍝ Ignore index, redduce, scan
 j←j∧astlop isDefinedFn ast
 i←(j⌿ast)[;astfn] ⍝ Don't alter dfn calls
 i←(~isnum i)∨i∊ER0 k/⍳⍴k
 j←j∧j\i
 j←j∧~MarkRankCalls ast ⍝ Don't mess with rank invocations
 ⍝ They're OK as is. 1996-06-08
 j←j/⍳⍴j
 fns[j;fnslop,fnsrop]←E''
 fns[j;fnsfn]←TempName lj⍕mcb j
 fns←ast GenAssignNames fns
 fns←ast GenFragNamesIndex fns      ⍝ Index names are hard
 fns←ast GenFragNamesAdvConj fns    ⍝ Adverb/conj names
 fns[;fnscomtyp]←ER1 GenComputeType fns
 r←fns
⍝⍝⍝⍝ r←ast GenFragNamesNoPA fns       ⍝ Kill :PA entries
