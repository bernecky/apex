 r←ConstProp y;cv;ast
 ⍝ Propagate constant characteristics to refs
 ast←D y[ssaast]
 cv←~dfainit ast ⍝ Get constants and varbs
 ast←cv PropArgs ast
 ast[;astPred]←SetPredicates¨ER1 ast ⍝ Set predicates
 r←y ⋄ r[ssaast]←E ast
