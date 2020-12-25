 Z←⍙IFNEST A
 ⍝Returns 1 if ⍵ is a nested/heterogeneous/boxed array, 0 if simple
 Z←(⎕DR A)∊326 807 ⍝ 326 is nested, 807 is heterogenous
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
