 r←cv EmitDyadicScalarConformabilityCheck y;scal;ast;fns;cal;larg;rarg;cl;typ
⍝# Emit Length Error checks for dyadic scalar fns
 ast←D y[0]
 fns←D y[2]
 cal←D y[3]
 larg←D cv⌿ast[;astlarg]
 rarg←D cv⌿ast[;astrarg]
 scal←1×(1=ast[larg;astxrho])∨1=ast[rarg;astxrho]
 cl←2×(ast[larg;astShapeClique])=ast[rarg;astShapeClique]
 typ←(E'dsf Check needed'),(E'dsf scalar(s)'),E'dsf clique'
 typ←typ,E'dsf Scalar & clique'
 typ←(BuildComment¨typ[scal+cl]),¨NL
 ⍝⍝⍝ Disabled ⍝⍝ cal[cv/⍳⍴cv;callenerr]←typ
 r←cal
