 r←EmitFnCallsConjunction y;j
 ⍝ Emit conjunction code for inline calls
 j←EmitFnCallsMonadicConjunction y ⍝ ??
 j←EmitFnCallsDyadicConjunction j  ⍝ ⍺ +.× ⍵
 j←EmitFnCallsRank j               ⍝ f"2 ⍵
 r←EmitFnCallsOuterProduct j       ⍝ ⍺ ∘.× ⍵
