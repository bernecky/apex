﻿UnDiamondize←{
 ⍝ The simplest way to deal with diamonds is to replace them by NL
 ⍝ Until we support guards or GOTO, that should be okay. 
 p←(⍵='⋄')∧(~InQuotes ⍵)∧~InComment ⍵
 z←,' ',⍵
 p←,1,p
 z[p/⍳⍴p]←NL
 vtom z
}
 

