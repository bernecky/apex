﻿ r←sg SemiGlobalsList ast;i
⍝ Get list of desired semiglobals for this ast
 r←((~dfainit ast)∧ast[;astscope]∊sg)/ast[;asttarget]
