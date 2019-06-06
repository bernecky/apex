 r←ast FunctionName y
⍝# Find name of function (y is ast[;astfn])
⍝ Name may be defined, derived, or primitive
 :If isnum y           ⍝ Defined
 ⍝⍝⍝⎕←'defined fn: ',y
     r←ast TargetName y
 :Else
⍝⍝⍝ ⎕←'primitive fn: ',y
     r←jsym ER1 y
 :EndIf
