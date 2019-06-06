 r←cv APLMarkPrimitive ast
⍝# Mark simple-to-generate ast rows within cv
 r←ast[;astfn]∊,¨⎕AV     ⍝ APL primitives
 r←cv∧r∨ast[;astfn]∊(E':For'),(E':EndFor'),(E':If'),(E':Endif')
⍝ more :ctlstruct stuff needed eventually...
