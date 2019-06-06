 r←MarkPAEntries ast;cv
⍝# Mark :PA entries and their callers
 cv←ast[;astfn]∊E':PA'
 cv←cv∨∨/ast[;astptrs]∊cv/⍳⍴cv
 r←cv
