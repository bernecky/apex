 ast2NilFn;ns;oldstate
⍝ Niladic fn left of something
⍝ Execute the function and stack the result
 :Select state
 :CaseList Stf      ⍝ Niladic fn left of function: ⎕av⍳x
     PushCursor Push Std
     InvokeNiladicFn Std
 :Case Stn          ⍝ Niladic fn left of BOS:  ...⎕av
     PushCursor Push Stx
     InvokeNiladicFn Stx
 :Case Stl          ⍝ Niladic fn left of left bracket: ⎕av[...]
     PushCursor Push Stx
     InvokeNiladicFn Stx
     snxl
 :Case Sto          ⍝ Niladic fn left of adverb ⎕ts/⍳7
     PushCursor Push Std
     InvokeNiladicFn Std ⍝ Execute ⎕ts-like fn
     InvokeMonadicFn     ⍝ Execute the reduce
 :Else
     snerr
 :EndSelect
