﻿ r←x SemiGlobalSGOparms i;ast;ctx;fns;ct;cds;astlist;asts;icall;tar;cs;j;sg;rl
⍝ Add ast rows to subfns asts[i] for semiglobal outputs
 ctx←D x[0]
 fns←D ctx[0]
 ct←D ctx[1]
 cds←D x[1] ⍝ Compiler data structures
 astlist←ssaast⊃¨cds
 asts←D cds[i]
 ast←D asts[ssaast]
 icall←×ct[i;] ⍝ Find who I call
⍝ Roll and Deal are the only primitives with a global result.
 :If 1∊icall ⍝ Any work?
     tar←ast[;asttarget]⍳icall/fns ⍝ fns we call; where we call them
     cs←(dfainit ast)∧(ast[;astfn]∊tar)
     j←E astscopeSGO+0,astscopeSGI ⍝ Outputs
     sgl←j SemiGlobalsList¨icall/astlist
     sg←sgl[tar⍳(cs⌿ast)[;astfn]]  ⍝ Output Semiglobals by call
 ⍝ Handle Roll and Deal, the only primitives w/global result
     rl←ast[;astfn]∊E,'?'          ⍝ All calls need ⎕rl out
     sg←sg,rl/E,E'⎕rl'
     sg←sg[⍋(cs/⍳⍴cs),rl/⍳⍴rl]       ⍝ Put entries in ast order
     ast←ast SemiGlobalSGOparmsOne(E cs∨rl),E sg
     asts[ssaast]←E ast
 :EndIf
 r←asts
