﻿ r←vars Ref asts;ast;tar;cv
⍝# Return vars that this fn references
 ast←D asts[ssaast]
 tar←(ast[;asttarget]∊vars[;0])/⍳1↑⍴ast
 r←tar∊(dfainit ast)⌿ast[;astptrs]
 r←(vars[;0]∊ast[r/tar;asttarget])⌿vars[;0]
