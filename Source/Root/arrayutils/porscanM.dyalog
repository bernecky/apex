﻿ r←p porscanM m;pm
⍝ Partitioned or-scan on matrices
 pm←0,m,0  ⍝ Padded-m for edge conditions
 r←(,1,p,1)porscan,pm
 r←0 1↓0 ¯1↓(⍴pm)⍴r
