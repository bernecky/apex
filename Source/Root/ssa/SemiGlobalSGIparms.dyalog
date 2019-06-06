 r←x SemiGlobalSGIparms i;ast;cds;asts;astlist;ctx;ct;fns;icall;tar;sgl;sg;j
⍝ Update subfunction calls of asts[i] with
⍝ semiglobal rows for input parameters.
 ctx←D x[0]
 fns←D ctx[0]
 ct←D ctx[1]
 cds←D x[1] ⍝ Compiler data structures
 astlist←ssaast⊃¨cds
 asts←D cds[i]
 ast←D asts[ssaast]
⍝ Defined function calls.
 icall←×ct[i;] ⍝ Find who I call
 :If 1∊icall  ⍝ Got work on defined fns
     tar←ast[;asttarget]⍳icall/fns ⍝ Our callees
     cs←(dfainit ast)∧ast[;astfn]∊tar ⍝ Calling sites
     j←E astscopeSGI+0,astscopeSGO ⍝ Input parameters
     sgl←j SemiGlobalsList¨icall/astlist ⍝ Ignore our fn
     sg←sgl[tar⍳(cs⌿ast)[;astfn]] ⍝ Input Semiglobals by call
     ast←ast SemiGlobalSGICommon(E cs),E sg
 :EndIf
 asts[ssaast]←E ast
 r←asts
