 r←ssadat EmitAdverbs fns;sis;j
 ⍝# Emit adverb definitions
 j←EmitReplicate fns             ⍝ Emit replicate and expand
 sis←Checksis D j[0]
 fns←D j[1]
 j←ssadat EmitDyadicAdverbsDerived fns ⍝ Reduce w/derived operands
 sis←Checksis sis,D j[0]
 fns←D j[1]
 j←EmitMonadicAdverbs fns        ⍝ Monadic adverbs w/primitive operands
 sis←Checksis sis,D j[0]
 fns←D j[1]
 j←EmitMonadicAdverbsDerived fns ⍝ Monadic adverbs w/derived operands
 j←ssadat EmitDyadicAdverbs fns         ⍝ Window-reduce, all operands
 sis←Checksis sis,D j[0]
 fns←D j[1]
⍝⍝later j←EmitScanDefined fns   ⍝ Non-primitive scans
⍝⍝later sis←sis,D j[0] ⋄ fns←D j[1]
 r←(E sis),E fns
