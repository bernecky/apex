﻿ r←sncl;k
 ⍝ Character constant left of left bracket
 k←stk[stkp-1;Stkstate] ⍝ ref vs assign (old state)
 PushCursor Push state
 'Source program syntax error: Indexed assign into constant'assert~k∊Sta
 snxl
