 r←ast ParmList i;p
 ⍝ Get list of indices for SemiGlobals starting at ast row i
 r←⍳0
 :if ~NULL≡i ⍝ Stupid APL2 prototypes
   r←ast[ast ParmIndices i;astrarg]
 :endif
