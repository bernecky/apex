 Z←⍙RJUST A
 ⍝ Right-justifies character vector or matrix A
 ⍝ Robert Bernecky 2003-05-05
 Z←(-+/∧\⌽A=' ')⌽A
