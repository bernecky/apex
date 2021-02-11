 r←sis EmitInnerProductOneTRANSPOSE fns;f;sis;sis2;fnsf;fnsg;gc;fnm;gnm;dfnm;fct;fzt;gct;gzt;k;fnsred;rednm;gen;rk
 ⍝# Emit one inner product using transpose algorithm
 fnsg←fnsrop ConjToFns fns ⍝ g in f.g
 fnsg[;fnstypes]←fns[;fnstypes] ⍝  Undo type damage caused by ConjToFns
 gct←,PFATct PFATProperty fnsg
 gzt←,PFATzt PFATProperty fnsg
 fnsg[;fnstypes]←E gct,gct,gzt
   ⍝ Get f type info
 fnsf←fnslop ConjToFns fns ⍝ f in f.g
 fnsf[;fnstypes]←E 3⍴gzt
 fct←,PFATct PFATProperty fnsf
 fzt←,PFATzt PFATProperty fnsf
 k←,D fnsf[;fnstypes]
 fnsf[;fnstypes]←E k[fnstypeslarg,fnstypesrarg],fzt
 fnsred←fnsf
 fnsred[;fnslop,fnsfn,fnsranks]←(fnsf[;,fnsfn],E'sl'),E'x10' ⍝ f/⍵
 gnm←,D Raze⍉fnsg[;,fnsfn]
 rednm←,D Raze⍉fnsred[;fnslop,fnsfn]
 sis←D sis[0]
 sis←'$FNM'Strepl(E sis),fns[;fnslop]
 sis←'$FRVALUE'Strepl(E sis),E gnm
 sis←'$FLVALUE'Strepl(E sis),E rednm
 sis←'$GCT'Strepl(E sis),E,gct
 sis←'$GZT'Strepl(E sis),E,gzt ⍝ Result type of g in f.g
 sis←'$CTYPE'Strepl(E sis),fct TypeRank rk
 sis←'$CT'Strepl(E sis),E,fct
 sis←'$ZTYPE'Strepl(E sis),fzt TypeRank rk
 sis←'$ZT'Strepl(E sis),E,fzt
 dfnm←,D Raze⍉fns[;fnslop,fnsfn,fnsrop,fnstypes] ⍝ Derived fn name
 sis←'$FNAME'Strepl(E sis),E dfnm
 sis←,D(E sis)SetFill(D fnsf[;fnstypes])[;fnstypesz]
 sis←'$CASEBL'MacroKill sis
 sis←'$CASEQUICKSTOP0'MacroKill sis
 sis←'$CASEQUICKSTOP1'MacroKill sis
 sis←'$CASESTAR'MacroKill sis
 sis←'$CASETRAN'MacroInsert sis
 sis←(E sis)InsertSysvarHeader GenSysvarArgs fns
 r←sis EmitPrimitiveFnDefnsTemplateFiller fns
