z←DiscloseIota ast;cvi;cvd
⍝ We handle "⊃⍳N", so we can generate a non-nested result.
⍝ In APL2 dialects, ⍳N generates a nested result, which apex does not support.
     cvd←(astfn⌷⍤1⊢ast)∊E,'⊃' ⍝ Monadic disclose
     cvd←cvd∧(astlarg⌷⍤1⊢ast)∊NULL
     cvi←0,¯1↓(astfn⌷⍤1⊢ast)∊E,'⍳' ⍝ Monadic iota, adjacent
     cvi←cvi∧(astlarg⌷⍤1⊢ast)∊NULL
⍝ We could have ⊃⍳/N, if you wanted to be nasty...
     ⍝ We replace:
     ⍝     t1← ⍳N
     ⍝     t2←⊃t1
     ⍝ by:
     ⍝     t1←⎕apexdiscloseiota N
     ⍝     t2←t1
     z←ast
     :if 1∊cvd^cvi 
       z[cvd/⍳⍴cvd;astfn]←E'⎕apexdiscloseiota' 
       z[cvi/⍳⍴cvi;astfn]←E,'←'
       n←⍕+/cvi^cvd
       ⎕←'⊃⍳N replaced ',n,' places in function: ',ast[dfnname;asttarget]
     :endif

