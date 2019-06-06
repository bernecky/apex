 r←ast isastnum y
 ⍝ Predicate for ast indices
 ⍝ Returns 1 for each thing that may be an ast index
 r←y∊ER0⍳1↑⍴ast
