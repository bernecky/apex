﻿ r←m EmitFnCallsIndexSetScalars y;sis;lhs;rhs
⍝# Generate code for X[I;J;;]←Y
 sis←D y[0]
 lhs←D y[1]
 rhs←D y[2]
 r←(E'modarray('),lhs,(E','),sis,(E','),rhs,E')'
 r[(~∨/m)/⍳1↑⍴m;]←E''
