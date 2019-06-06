﻿ r←ssa EmitCompose fns;ast;i;j;k;sis;m;fn;wiu;ssa;tar;def;fwd;cv
 ⍝ Emit code for compose
 ⍝ We define one function per composition.
 ⍝ Today, this only handles currying of an array
 ⍝ to a dyadic fn to make it monadic.
 ⍝ As of 1995-11-15, this is hopefully simpler.
 ⍝ It now emits a call to the fn with fixed arg,
 ⍝ and adjusts fns to include the call.
 ⍝ This probably fails on multiple composes in 1 fns.
 ⍝ (UNTESTED on multiple compositions)
 sis←''
 cv←1
 :If ~0∊⍴fns
     ast←D ssa[ssaast]
     r←(E''),E fns
     i←ast[;astclass]∊astclassLFN ⍝ Locate localfns
     cv←ast[;astfn]∊E,'&' ⍝ De compose
     :If 1∊i ⍝ Any work?
   ⍝ Build skeleton fn(s)
         tar←mcb ast TargetName i⌿ast[;asttarget]
         sis←(E'function '),tar/ ⍝ This needs fn header.
   ⍝ Argument and result defns
         j←(i⌿ast)[;astlop,astrop] ⍝ fn&arg, arg&fn
   ⍝ j may represent any of primfn, defined fn,
   ⍝ derived fn, or array. Distinguish these cases.
   ⍝ Since we don't support f&g today, there must
   ⍝ be exactly one fn in each line.
   ⍝ Fn if not numeric or if numeric & right astclass
         fn←,isnum j ⍝ Non-primitives
         k←D fn/,j ⍝ Nulls or ptrs.
         k←ast[k;astclass]∊astclassDFN,astclassLFN
         fn←(⍴j)⍴(~fn)∨fn\k ⍝ Fn marks composed fn
         wiu←ast[;astlop,astfn,astrop]∊ER0 i/⍳⍴i ⍝ Who invokes us
         'Under construction'assert 1∧.≥+/wiu ⍝1 invocation per composed fn
         m←,(i⌿ast)[;astlop,astrop]
         fwd←ast FindReferent(,fn)/m ⍝ Fn being curried
         k←(⍳1↑⍴ast)∊fwd
         fwd←ast GenerateFnHeader k
         sis←sis,Raze Raze⍉fwd[1] ⍝ Just defn part
         sis←sis,Raze Raze⍉fwd[0] ⍝ Callee
   ⍝ The above two lines can maybe be merged... 1995-11-20
         sis←sis,E'(x,y)',NL,'} /* End function',NL
   ⍝ Since we don't know ordering of code generation,
   ⍝ we'll generate a FORWARD FUNCTION statement for
   ⍝ the composed fn.
         fwd←D Raze⍉(E'forward function '),mcb Raze⍉fwd
         sis←fwd,NL,sis
         m←mcb(,~fn)/m
         m←ast TargetName m
         m←(</fn)⌽(E'$YV'),mcb m ⍝ Swap args as needed
         m[;0]←m[;0]catenateeach E','
   ⍝ Here we update fns, so EmitFnCalls will gen correct call
         fns[i/⍳⍴i;fnslarg,fnsrarg]←m
         fns[i/⍳⍴i;0,fnsfn,2]←(E''),tar,E'' ⍝ Set derived fn name
         sis←D Raze Raze⍉sis
         r←(E sis),E fns
     :EndIf
 :EndIf
