﻿ r←GetField y;cv
 ⍝ Get first field in each row of y
 cv←∧\' '≠y
 r←(1↑⍴y)⍴PEN2(squeeze(,cv,1)/,y,' '),' '
