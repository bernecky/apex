﻿ r←noblanks y;i
 ⍝ Remove interword blanks from each row of y
 i←(y=' ')∧~≠\y='''' ⍝ Leave quoted blanks
 i←⍋¨ER1 i
 r←(,y)[D i+(⍳⍴i)×¯1↑⍴y]
