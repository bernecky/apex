 r←dfaSemiGlobals y;ast;wl
 ⍝ dfa for semi-globals. Does little, as this
 ⍝ service is done during interprocedural dfa.
 ⍝ It does, however, update the worklist.
 wl←D y[ssacv]
 ast←D y[ssaast]
 wl←wl∧~ast[;astfn]∊(E':GI'),(E':GO')
 r←y
 r[ssacv]←E wl
