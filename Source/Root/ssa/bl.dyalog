﻿ z←x bl y
 ⍝ set y to blank where indicated by x
 z←,y
 x←~,x
 z←x\x/z
 z←(⍴y)⍴z
