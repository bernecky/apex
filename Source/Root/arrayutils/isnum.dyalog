﻿ r←isnum y
 ⍝ Predicate for boxed elements
 ⍝ Returns 1 for each boxed numeric thing, else 0
 r←(⍴y)⍴D Raze⍉0=1↑¨0⍴¨y
