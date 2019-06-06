 r←ast GenAssignNames fns;cv;typ
⍝ "Generate" assign names.
⍝ We merely delete all indication that a
⍝ function is involved, so that SISAL generates
⍝ a pure assign as it would for any temp.
 cv←ast[;astfn]∊E Copy
 typ←(D cv⌿fns[;fnstypes])[;1 2] ⍝ arg, result types
 'coding time'assert∧/=/typ ⍝ Coding time for type coercion
 fns[cv/⍳⍴cv;⍳fnsrarg]←E''
 r←fns
