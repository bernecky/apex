 r←IsReduceScan ast
⍝ Separate Reduce/Scan sheep from Compress\Expand goats
 r←(ast[cv;astfn]∊ER1 mcb'/\⍀⌿')∧ast[;astlop]∊NULL
⍝ This fails to detect cases of mask/mesh, if we ever implement them!
