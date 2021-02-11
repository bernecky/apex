 r←ast FindPA y;astloprop;ind
⍝# Find PA entries associated with conjs/advs at ind
 astloprop←D y[0] ⍝ Pick f or g in f.g, etc.
 ind←D y[1]
 r←D ast[ind;astloprop] ⍝ Point to operand fn entry
 r←D ast[r;astlarg,astrarg]
 'Bobbo is confused'assert∧/ast[r;astfn]∊E':PA'
