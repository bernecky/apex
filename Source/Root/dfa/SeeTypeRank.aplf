 r←SeeTypeRank ast;tp;rk;cv;val
⍝ Human-readable display of type, rank, value for ast
 r←AstToAPL ast
 cv←(dfainit ast)∧~isAstGarbage ast
 tp←cv⌿'?BIDZCJ'[1+D ast[;asttype]]
 rk←cv⌿ast[;astrank]
 rk[(rk∊¯1)/⍳⍴rk]←E'?'
 val←cv⌿⍪'K?'[ast[;astvalue]∊NULL]
 r←tp,rk,val,r
