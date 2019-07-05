﻿ r←fldr EmitOneCU asts;i;m;cudefinedfns;m;fnslop;fnsfn;fnsrop;fnstypes;fnsranks;fnslpar;fnslarg;fnsrarg;fnsrpar;calfn;caltypes;calranks;callpar;callarg;calcomma;calrarg;calrpar;fns;fnstypeslarg;fnstypesrarg;fnstypesz
 ⍝# Emit compiled APL code for one Compilation Unit(CU), asts
 ⍝# Result is written to file in fldr
 ⎕←(fts ⎕TS),': Starting code generation for: ',fldr
 InitializeFns   ⍝ and cal
 ⍝ Build mainline code, identify primitives
 asts←SACNames¨asts ⍝ Map names to avoid SAC keyword conflicts, etc
 i←EmitOneUserDefinedFn¨asts ⍝ Emit all user-defined fns
 cudefinedfns←D Raze 0⊃¨i
 fns←D nub ER1 D Raze 1⊃¨i
 sis←fns EmitPrimitiveFnDefns asts
 sis←D Raze sis,cudefinedfns
 EmitOutputFile(E asts),(E sis),E fldr
 m←D(FileNameBreak fldr)[1] ⍝ Get filename
 ((-⍴m)↓fldr)CoverFn fldr ⍝ Create cover function for APL ws
 ⎕←(fts ⎕TS),': Code generation complete for: ',fldr
