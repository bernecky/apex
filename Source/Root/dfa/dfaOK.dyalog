 r←dfaOK y;ast;j;k;ptr
 ⍝ Ensure we have sufficient info to gen code.
 ⍝ We need type and rank for all operations.
 ast←D y[ssaast]
 ⍝ Ignore identifiers, nulls and compiler stuff
 k←NULL,(E':PHI'),(E':EndFor'),(E,'['),(E,']'),(E,'€')
 k←k,(E':GI'),(E':GO'),(E':RE'),(E':RI'),(E':PA'),E,'∘'
 j←(dfainit ast)∧~ast[;astfn]∊k
 k←dfnlarg,dfnrarg,dfnres    ⍝ Check args & results
 j[k]←~ast[k;asttarget]∊NULL,astNoFn
 j←j∧~ast[;astfn]∊ER1⍪';' ⍝ Ignore lists
 ptr←(⍳+/~dfainit ast)∊j⌿ast[;astptrs]
 j←j∨(⍴j)↑ptr                ⍝ Check any var (not fn) that's referenced
 j←j∧~ast[;astclass]∊astclassNFN,astclassMFN,astclassDFN
 k←∨/(j⌿ast[;astrank,asttype])∊NULL
 :If 1∊k
     ⎕←'Function',ast[dfnname;asttarget],' is missing rank/type for:'
     ⎕←9 seeast(j\k)⌿ast
     ⎕←10 seeast ast
 :EndIf
 r←∧/~k ⍝ know all var types & ranks
