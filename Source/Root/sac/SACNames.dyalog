﻿ r←SACNames csd;ast;b;st;cls
⍝ Map names in csd to legal SAC names.
 ast←D csd[ssaast]
 cls←astclassDFN,astclassVARB,astclassGFN,astclassMFN,astclassNFN
 b←(~dfainit ast)∧ast[;astclass]∊cls
 b←b/⍳⍴b
 ast[b;asttarget]←MapNames¨ast[b;asttarget]
 r←csd
 r[ssaast]←E ast
⍝
⍝⍝b←(st[;stclass]∊cls)/⍳1↑⍴st
⍝ Don't tinker with constants
⍝⍝DEAD st[b;stname]←MapNames¨st[b;stname]
