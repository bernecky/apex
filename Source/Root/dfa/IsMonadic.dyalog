﻿ r←IsMonadic ast
⍝ Predicate for marking monadic invocations of fns
 r←ast[;astlarg]∊NULL
