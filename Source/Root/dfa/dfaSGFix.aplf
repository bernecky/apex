 newcsd←dfaSGFix csd;ast;cv
⍝ Remove superfluous astscope info that will
⍝ otherwise screw up code generation
 ast←D csd[ssaast]
 cv←ast[;astfn]∊E':PHI'
 ast[cv/⍳⍴cv;astscope]←0 ⍝ We don't need no steenking sgi
 newcsd←csd
 newcsd[ssaast]←E ast
