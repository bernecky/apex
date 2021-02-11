 r←mil EmitFnCallsIndexDirectOK ast;refs;dmil
⍝# Mark index ref ops that don't require a loop
 dmil←D mil
 refs←ast IndexAstLarg ast FindReferent dmil ⍝ Actual index arrays
 refs←refs×0≠dmil                            ⍝ Ignore null entries
⍝ Mark index ops w/scalar indices
 r←∧/(refs∊0,NULL)∨0=D ast[0⌈refs;astrank] ⍝ Scalar indices
⍝ All-scalar (X[i;j;k]) or all-NULL (X[;;;]) indices
