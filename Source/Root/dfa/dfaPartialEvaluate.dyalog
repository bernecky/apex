 r←dfaPartialEvaluate asts;pe;i;fns;ast;astr
⍝ Perform partial evaluation when we know
⍝ primitive function argument values.
 r←asts
 :If PartialEvaluation≡'yes'
     ast←D asts[ssaast]
 ⍝ Set the result value, if we know the argument values.
 ⍝ Today (1999-04-23),
 ⍝ we only do a subset of fns -- those without side
 ⍝ effects and that do not need system variables.
 ⍝
 ⍝ Do dyadic fns
     fns←',↑↓⌽○*⍟⌈⌊+-×÷' ⍝ Dyadic fns
     cv←ast[;astfn]∊ER1 mcb fns
     cv←cv∧~ast[;astlarg]∊NULL ⍝ Dyadics only
     cv←cv\~ast KnowValue cv/⍳⍴cv ⍝ Don't recompute known values
 ⍝ Must know values of larg and rarg
     cv←cv\ast KnowValue cv/ast[;astlarg]
     cv←cv\ast KnowValue cv/ast[;astrarg]
 ⍝ The following gets us around wsfull, domain error, etc.
     astr←cv SafeEvaluate ast
     astr←astmerge(E ast),(E cv⌿astr),E cv
⍝⍝⍝ r[ssacv]←E (D r[ssacv])∨ D astr[1] ⍝ New worklist
     r[ssaast]←astr[0] ⍝ New ast
 :EndIf
