 r←cv SafeEvaluate ast;larg;rarg;fn;li;ri;row;z;j;ncv
⍝ Evaluate rows of this ast marked by cv.
⍝ If something goes wrong, tell the user, ignore
⍝ the error, and keep going.
 :For j :In cv/⍳⍴cv
     row←ast[j;]
     fn←D row[astfn] ⍝ Assume no indexing, ⎕io,⎕ct etc
     li←D row[astlarg] ⍝ Find function args
     ri←D row[astrarg]
     larg←GetArgument ast[li;]
     rarg←GetArgument ast[ri;]
     z←⍎'larg ',fn,' rarg'
     row[astvalue]←E⍕,z
     row[asttype]←E Types⍳type z
     row[astrank]←''⍴⍴⍴z
     row[astshape]←E⍴z
     row[astxrho]←×/⍴z
 ⍝ Update predicates
     row[astPred]←E SetPredicates row
     ast[j;]←row
 :EndFor
 →lz
oops:⎕elx  ←'' ⍝ ⎕elx goes here supposedly
 ⎕←dm←⎕DM
 ∘ ⍝ Stop here and think about corrective action
lz:r←ast
