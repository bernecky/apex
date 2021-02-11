 r←EmitReduceStopOnValue fns;fn
⍝ Compute stop-on values for foldfix reductions
⍝ For example, we can stop when we hit a 0 when doing and-reduce
⍝ Min and max only on Booleans, of course
 fn←(E'and'),(E'mpy'),(E'min'),(E'max'),E'or'
 r←'00011?'[fn⍳fns[;fnslop]]
