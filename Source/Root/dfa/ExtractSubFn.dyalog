 r←cv ExtractSubFn ast;refs;new;lns;n;i;m
 ⍝ Mark the subset of an ast needed to
 ⍝ analyze the ast rows marked by cv.
 ⍝ Result is new cv.
 ⍝ Due to problems mapping extracted portion
 ⍝ back into original ast, we return same shape
 ⍝ result with boring stuff marked dead.
 refs←astlarg,astlop,astfn,astrop,astrarg
 lns←ER0⍳1↑⍴ast ⋄ i←cv
lp:cv←cv∨i ⍝ Add selected rows
 i←lns∊(cv⌿ast)[;refs] ⍝ Transitive closure stuff
 →(1∊i>cv)/lp ⍝ More rows
 r←cv ⍝ cv now marks rows we need.
