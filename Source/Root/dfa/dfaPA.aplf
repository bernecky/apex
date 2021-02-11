 r←dfaPA y;ast;wl;i
 ⍝# Clean up after conj/adv expns
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E':PA'
 wl←wl∧~i ⍝ Update worklist
 wl←wl∨(1⌽i)>i ⍝ Activate the thingy before each :PA set
 r←y
 r[ssacv]←E wl
