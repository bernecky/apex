 Z←DEVLEVEL
 ⍝Returns the current )EVLEVEL setting for APL*PLUS II or III
 ⍝ Possible results are:   0  - err on use of any changed feature
 ⍝                         1  - use old APL*PLUS/NARS definitions
 ⍝                         2  - use newer APL2 definitions
 Z←0
⍝ ⎕ELX←'→0'
 Z←''⍴(1 2)[1 0⍳⍴⍴↑2 2] ⍝ ↑⍵ is mix in evlevel 1, first in evlevel 2
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
