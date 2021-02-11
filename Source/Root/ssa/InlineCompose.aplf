 r←InlineCompose asts;cv;ast;lr;f;v;b;di;t;i;a2
 ⍝ Replace compositions with their inlined expansions
 ast←D asts[1]
 cv←ast[;astfn]∊E,'&'
 r←asts
 →(0=∨/cv)⍴0 ⍝ No work
 ⍝ May be f&varb or varb&f
 lr←(cv⌿ast)[;astlop,astrop] ⍝ Compose args
 b←isnum lr ⍝ Primitive vs defined/derived
 di←dfainit ast
 'No primitives yet - under construction'assert∧/,b
 t←,ast[D lr;astclass] ⍝ vV or Vv
 t←t∊astclassLFN
 ⍝ Extract fns
 f←ast[D t/,lr;astlop,astfn,astrop]
 v←(~t)/,lr ⍝ Mark varbs
 ⍝ Insert fns, maybe move args
 a2←ast
 a2[cv/⍳⍴cv;astlop,astfn,astrop]←f
 a2[cv/⍳⍴cv;(~t)/astlarg,astrarg]←v
 ⍝ Finally, kill the derived fn defn
 a2[>t/,lr;]←NULL
 r[1]←E a2
