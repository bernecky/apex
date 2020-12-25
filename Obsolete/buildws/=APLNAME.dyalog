 Z←⍙APLNAME
 ⍝Returns a string identifying the current APL system and environment
 Z←⍙DLTB(⍙APLVER⍳'-')↓⍙APLVER ⍝ APL system description
 →('APLPLUS'∨.≠7↑⍙APLVER)/L1
 →(~(1↑7↓⍙APLVER)∊'23')/L1
 Z←Z,' with Evlevel=',⍕⍙EVLEVEL
L1:→('APL2'∨.≠4↑⍙APLVER)/L2
 Z←Z,' for ',⍙OPSYS
L2:→('APL68K'∨.≠6↑⍙APLVER)/L3
 Z←Z,', Level ',⍙LEVEL⍴'I'
L3:→('IPSA'∨.≠4↑⍙APLVER)/0
 Z←Z,'/',⍙IPSAVER
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
