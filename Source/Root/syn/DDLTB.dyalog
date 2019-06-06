 Z←DDLTB A
 ⍝Deletes leading and trailing blank columns in vector or matrix ⍵
 →(A←''⍴(⎕STPTR  'Z A')⎕CALL  DDLTB∆OBJ)↓0
 ⎕ERROR  (5 7 8⍳A)⊃'RANK ERROR' 'VALUE ERROR' 'WS FULL' 'DOMAIN ERROR'
 ⍝ Copyright (c) 1988, '92, '94 by Jim Weigang
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
