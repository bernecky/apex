 r←EmitFnCallsOuterProduct y;ast;cv;fns;cal
 ⍝# Emit outer product calls
 ast←D y[0] ⋄ fns←D y[2] ⋄ cal←D y[3]
 cv←ast[;astfn]∊ER1 mcb'.' ⍝ Not many of these today
 cv←cv∧~ast[;astlarg]∊NULL ⍝ Dyadic derived fns
 cv←cv∧ast[;astlop]∊E,'jot'  ⍝ Primitives only
 cal[cv/⍳⍴cv;fnslpar]←E'' ⍝ No rank specifier
 cal←cv EmitAssignment(E ast),E cal
 r←y
 r[3]←E cal
