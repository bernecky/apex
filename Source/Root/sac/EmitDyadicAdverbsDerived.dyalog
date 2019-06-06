﻿ r←ssadat EmitDyadicAdverbsDerived fns;ctl;n;f;fn;t;cv;nm;sis;ssa;sg;sgn;sgl;ast
 ⍝# Emit Dyadic adverb fn SAC code, e.g., Window-reduce
 ⍝# This function supports ONLY derived and defined operands
 sis←''
 :If 0 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝FIXME ~0∊⍴fns
     ast←D ssadat[ssaast]
     ctl←7 FragmentCode'dadverbs'
     nm←PrimitiveToJsym ast[;astfn]
     cv←(nm∊ctl[;ctlfn])∧~ast[;astlop]∊NULL ⍝ Not replicate or expand
     cv←cv∧~ast[;astlarg]∊NULL ⍝ Dyadic derived fns
     cv←cv∧isnum ast[;astlop] ⍝ non-primitives only
     :If 1∊cv ⍝ Any work?
         /
   ⍝ Match on fn name, valence, & l/r types
         fn←ctl FindFnOnly cv⌿nm
         n←<⍀(ctl FindRankOnly ER1 cv RanksAst ast)∧fn
         cv←cv∧∨/n
         sis←ctl Getsis n
         :If 1∊cv ⍝ Any work?
    ⍝ Must get additional operands to the derived fn
    ⍝ here, and stick them into the call.
             nm←cv⌿ast[;,astlop]
    ⍝ Get invocators for operands
             f←(E ast)FindInvocator¨ER1(mcb cv/⍳⍴cv),mcb nm
             sg←(E ast)SGList¨ast[f;astparms] ⍝ Semi-globals
             f←Raze⍉fns[f;fnsfn,fnslpar,fnslarg,fnsrarg]
             sgn←(E ast)TargetName¨sg
             sgl←AddCommas¨sgn ⍝ Extra parameters
             f←f catenateeach Raze¨sgl
             f←f catenateeach E')'
             t←(E'$FRVALUE'),E'$YV'
             sis←(E t)DoMacro¨ER1(mcb sis),f
    ⍝ Update fns to include semiglobal names in
    ⍝ parameter list.
             t←sgl catenateeach fns[cv/⍳⍴cv;fnsrpar]
             t←,¨D¨Raze¨t
             fns[cv/⍳⍴cv;fnsrpar]←t
    ⍝ Name of this fn is special, because of the derived fns.
    ⍝ Generate list of global name characteristics for
    ⍝ placement in header of this fn.
             t←':',¨¨(E E ast)TypeDefn¨¨sg
             t←,¨D¨Raze¨sgn,¨¨' ',¨¨t,¨¨E E';',NL
             t←¯1 dropeach t
             sis←(E'$GLOBALS')Strepl¨ER1(mcb sis),mcb t
    ⍝ Generate special name for the function, as it
    ⍝ is not a normal primitive.
             t←ER1 TempName cv/⍳⍴cv
             sis←(E'$FNAME')Strepl¨ER1(mcb sis),mcb t
    ⍝ Update fns so we generate correct invocation name.
             fns[cv/⍳⍴cv;fnsfn]←t
             :For i :In cv/⍳⍴cv ⍝ Kill the f invocation
                 t←i+(i↓ast[;astfn])⍳ast[i;astlop]
                 ast[t;]←NULL
             :EndFor
    ⍝ Insert argument & result types
             sis←sis EmitPrimitiveFnDefnsTemplateFiller fns
             fns[cv/⍳⍴cv;fnslop,fnsrop,fnstypes,fnsranks]←E''
         :EndIf
     :EndIf
 :EndIf
 r←(E sis),E fns ⍝ No changes to fns here
