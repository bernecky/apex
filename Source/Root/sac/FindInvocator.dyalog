﻿ r←ast FindInvocator y
⍝ y[0] is the ast index of an operator expn
⍝ y[1] is the ast index of a name that is a derived
⍝ or defined argument to the operator.
⍝ Find the ast row where y[1] is invoked shortly
⍝ after y[1] (for dfa reasons -- the actual ast row
⍝ we find will never actually be used).
 r←y[0]+(y[0]↓ast[;astfn])⍳y[1]
