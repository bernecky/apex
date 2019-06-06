﻿ r←sis EmitInnerProductOneMacros fns;f;sis;sis2;fnsf;fnsg;gc;fnm;gnm;dfnm;fct;fzt;gct;gzt;k;fnsred;rednm
 ⍝# Perform common inner product macro-expansion
 fnsg←fnsrop ConjToFns fns ⍝ g in f.g
 gct←,PFATct PFATProperty fnsg
 gzt←,PFATzt PFATProperty fnsg
 fnsg[;fnstypes]←E gct,gct,gzt
 sis2←D(EmitDyadicScalarFns fnsg)[0] ⍝ Emit g
   ⍝ Get f type info
 fnsf←fnslop ConjToFns fns ⍝ f in f.g
 fnsf[;fnstypes]←E 3⍴gzt
 fct←,PFATct PFATProperty fnsf
 fzt←,PFATzt PFATProperty fnsf
 k←,D fnsf[;fnstypes]
 fnsf[;fnstypes]←E k[fnstypeslarg,fnstypesrarg],fzt
   ⍝ Emit reduce function, f
 fnsred←fnsf
 fnsred[;fnslop,fnsfn,fnsranks]←(fnsf[;,fnsfn],E'sl'),E'x10' ⍝ f/⍵
 sis2←sis2,D(EmitMonadicAdverbs fnsred)[0]
 gc←(∨⌿prim FindFrag fnsg)⌿prim
 fnm←,D Raze⍉fnsf[;fnslop,fnsfn,fnstypes]
 gnm←,D Raze⍉fnsg[;fnsfn,fnstypes]
 rednm←,D Raze⍉fnsred[;fnslop,fnsfn,fnstypes]
 sis←'$FRZTYPE'Strepl(E sis),E TSAC,D gc[;frgdsfzt]
 sis←'$FRVALUE'Strepl(E sis),E gnm
 sis←'$FLVALUE'Strepl(E sis),E rednm
 sis←'$CT'Strepl(E sis),E,LC gct
 dfnm←,D Raze⍉fns[;fnslop,fnsfn,fnsrop,fnstypes] ⍝ Derived fn name
 sis←'$FNAME'Strepl(E sis),E dfnm
 sis←,D(E sis)SetFill(D fnsg[;fnstypes])[;fnstypesz]
 sis←'$CASEBL'MacroKill sis
 sis←'$CASEQUICKSTOP0'MacroKill sis
 sis←'$CASEQUICKSTOP1'MacroKill sis
 sis←'$CASESTAR'MacroKill sis
 sis←'$CASETRAN'MacroInsert sis
 sis←(E sis)InsertSysvarHeader GenSysvarArgs fns
 /
 sis←sis EmitPrimitiveFnDefnsTemplateFiller fns
 r←sis,sis2
