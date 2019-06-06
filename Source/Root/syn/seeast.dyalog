 r←{width}seeast ast;dec;decast;p
 :If 0=⎕NC'width'
     width←¯1↑⍴ast
 :EndIf
 width←width⌊¯1↑⍴ast
 r←(¯1↑⍴ast)⍴E''
 r[asttarget]←E'target'
 r[astlarg]←E'x'
 r[astfn]←E'fn'
 r[astlop]←E'lop'
 r[astrop]←E'rop'
 r[astrarg]←E'y'
 r[asttype]←E'type'
 r[astrank]←E'rank'
 r[astshape]←E'shape'
 r[astclass]←E'class'
 r[astvalue]←E'value'
 r[asttoken]←E'token'
 r[aststmt]←E'stmt'
 r[astxrho]←E'xrho'
 r[asttag]←E'tag'
 r[astPred]←E'Pred'
 r[astPredValues]←E'PredValues'
 r[astparms]←E'parms'
 r[astscope]←E'scope'
 r[astShapeClique]←E'shapeclique'
 r[astShapeExpn]←E'ShapeExpn'
 r[astShapeGuard]←E'shapeguard'
 r[astSpecCase]←E'speccase'
 p←asttarget,astlarg,astlop,astfn,astrop,astrarg
 dec←ast FindTarget ast[;p]
 decast←ast
 decast[;p]←dec
 r←r⍪decast
 :If 0≠⎕NC'width'
     r←r[;⍳width]
 :EndIf
