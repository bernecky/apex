﻿ r←dfainit ast
 ⍝ cv for code part of ast
 r←ast[;asttarget]∊aststz
 r←(~r)∧∨\r
