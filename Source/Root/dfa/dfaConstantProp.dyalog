 r←dfaConstantProp y;ast;wl;cv
 ⍝ Perform constant propagation
 ast←D y[ssaast]
 wl←D y[ssacv]
 ⍝ We will look at all entries in which both arguments
 ⍝ have known values, but in which the result value is
 ⍝ not known. For those entries, we will generate the
 ⍝ result value. If it is "small", we will propagate it.
 ⍝ The only reason for this limit is to avoid wsfull
 ⍝ in the compiler.
 ⍝ We don't handle compositions, adverbs, or conjunctions
 ⍝ today due to feeblemindedness and Godzilla deadlines.
 ⍝ 1996-04-13
 cv←(dfainit ast)∧~isnum ast[;astfn] ⍝ Primitive fns
 cv←cv∧∧/ast[;astlop,astrop]∊NULL ⍝ No adverbs, etc
 ⍝
 ⍝ Do monadic ones first
 →lz ⍝ FIXME
 cv2←cv\(cv⌿ast[;astlarg])∊NULL
 cv2←cv2\...


lz:r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
