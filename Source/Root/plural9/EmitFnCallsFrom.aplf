 r←EmitFnCallsFrom y;fns;cv;lht;rht;zt;cal;t;ast
⍝# Emit function calls for "from"
 ast←D y[0] ⍝ ast
 fns←D y[2] ⍝ All fn names
 cal←D y[3] ⍝ Generic calls
 cv←ast[;astfn]∊E,'{' ⍝ Find from calls
 :If 1∊cv ⍝ Any work?
 ⍝ Gen new, improved parameter list
     lht←lhtype cv⌿fns
     rht←rhtype cv⌿fns
     t←t,(E'(('),cv⌿cal[;,callarg],E'),' ⍝ lharg
     t←t,lht,',' ⍝ lhtype
     t←t,'(',cv⌿cal[;,calrarg],E'),'    ⍝ rharg
     t←t,rht ⍝ rhtype
 ⍝ Insert new calls into fns
     cal[cv/⍳⍴cv;calfn]←E''
     cal[cv/⍳⍴cv;caltypes]←D¨Raze¨ER1 t
     cal←cv EmitAssignment(E ast),E cal
 :EndIf
 r←y ⋄ r[3]←E cal
