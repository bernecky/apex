 r←AstToAPL ast;hdr;cv;tar;larg;fn;rarg;arr
⍝ Generate APL code from ast
 hdr←APLHeader ast
 cv←dfainit ast
 cv←cv∧~isAstGarbage ast
 tar←⍪NoNull ast TargetName ast[;asttarget]
 larg←⍪NoNull ast TargetName ast[;astlarg]
 fn←⍪NoNull ast TargetName ast[;astfn]
 rarg←⍪NoNull ast TargetName ast[;astrarg]
 arr←⍪((E,'←'),E'')[ast[;astfn]∊E,'←']
 r←tar,arr,larg,fn,rarg
 r←cv⌿r
 r←D Raze⍉r
