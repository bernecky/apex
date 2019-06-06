 InvokeFn;astr;k
⍝# Invoke stacked fn/adv/conj (monadic or dyadic)
 :If state=Stf              ⍝ Function stacked?
     InvokeMonadicFn
 :Else
     InvokeDyadicFn
 :EndIf
