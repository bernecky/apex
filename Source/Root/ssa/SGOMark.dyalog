﻿ r←cv SGOMark ast;i;list
⍝ Mark semiglobal-out lists for fn call at cv
⍝ The :GO lists are, ahem, not lists, just stuff glued
⍝ into the ast after each call. They SHOULD be a list, like :GI
 r←0,¯1↓cv
 r←r pandscan ast[;astfn]∊E':GO'
 list←D ast[;astImplicitResult]
 list←(~list∊NULL)/list ⍝ This is the proper way...
⍝⍝'utter confusion' assert r≡(⍳1↑⍴ast)∊list,ast IndexList list,astparms
