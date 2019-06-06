 r←astNewRows n
⍝ Build n empty ast rows
 r←(n,astcols)⍴NULL
 r[;astPred]←E astPredLen⍴0
 r[;astscope]←E astscopeL
 r[;astPredValues]←E astPredLen⍴E⍳0
