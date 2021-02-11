 r←ast APL2000Results n;t;sr
⍝ Build APL2000 ⎕na result descriptor(s) for
⍝ ast[n;]
⍝
⍝ As of 1998-02-22, we only support one result.
⍝ However, that may be a scalar or non-scalar. If it's scalar,
⍝ it is the result of the DLL (according to APL+Win). If non-scalar,
⍝ it is another type. We build two pieces, one for scalar or default
⍝ result, another for non-scalar result.
 r←''
 t←D ast[n;asttype]
 →(t=NULL)⍴0 ⍝ no work to do.
 t←(APL2000Types)[1+t;] ⍝ Type of thing.
 sr←D ast[n;astrank] ⍝ Scalar result?
 :If sr=0 ⍝ Scalar result
     r←D ast[n;astrank]
     r←(' *'[r>0]),t
     r←(r≠' ')/r ⍝ Neatness only
     r←(E r),E'' ⍝ Just the scalar result today
 :Else ⍝ Non-scalar result
     r←E'I4' ⍝ Standard APL+Win non-scalar "result"
 ⍝ For non-scalars, we append a pair of shape/ravelleddata
     r←r,E'*I4←,*',t,'←'
 :EndIf
