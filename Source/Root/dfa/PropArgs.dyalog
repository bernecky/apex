﻿ r←cv PropArgs ast;lr;t;b;rr
 r←ast
 →0
⍝ Dead code now?

 ⍝ Propagate new info about arguments to
 ⍝ the users of those arguments
 ⍝ This is done so that code generation can, e.g.,
 ⍝ generate code for a derived fn without having
 ⍝ to duplicate the work done by dfa to determine
 ⍝ the argument types and ranks of a cut that
 ⍝ invokes it. foo12 convolution is a good example.
 ⍝ Data comes from cv rows
 lr←,(ER0 cv/⍳⍴cv)⍳ast[;astlarg]
 t←(cv⌿ast)[;asttype,astrank] ⍝ Type,rank
 b←lr≠+/cv ⍝New stuff
 lr←b/lr
 rr←,(ER0 cv/⍳⍴cv)⍳ast[;astrarg]
 t←(cv⌿ast)[;asttype,astrank] ⍝ Type,rank
 b←rr≠+/cv ⍝New stuff
 rr←b/rr
 r←ast
