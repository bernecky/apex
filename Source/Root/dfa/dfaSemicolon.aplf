 r←dfaSemicolon y;ast;wl;i
 ⍝ Handle index propagation so indexing works
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E,';' ⍝Index lists
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 ⍝ All index lists are temps, and are only used
 ⍝ by one index operation. They are ref'd by
 ⍝ astrarg, so this code should suffice to poke
 ⍝ dfaIndex and dfaIndexAssign.
 wl←wl∨ast[;astrarg]∊ER0 i/⍳⍴i
 r←y ⋄ r[ssacv]←E wl
