 r←mil EmitDefnsIndexAssignResh fns;cv;p;gen
⍝# Emit reshape-Y statements for indexed assign w/scalar Y
 cv←'0'=(D fns[;fnsranks])[;fnsranksrarg] ⍝ Y is scalar
 p←(⍴mil)⍴EmitDefnsIndexAssignMarkElidedTrailingAxes mil
 p←+/p∧mil≠0 ⍝ # trailing elilded axes
 cv←cv∧p≠0   ⍝ Reshape needed here
 gen←(E'Y = genarray(take([-'),¨(⍕¨cv/p),¨E'],shape(X)),Yin);',NL
 r←(⍴cv)⍴E'Y = Yin;',NL ⍝ Assume no work
 r[cv/⍳⍴cv]←gen
