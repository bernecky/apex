 r←sis EmitPrimitiveFnDefnsTemplateFiller fns;i;TYP;fn;s;rk;tp
 ⍝# Template filler for code fragments sis
 s←fns[;fnsspec]
 fns[(s∊E,'.')/⍳⍴s;fnsspec]←E''
 fn←mcb Raze⍉fns[;fnslop,fnsfn,fnsrop,fnstypes,fnsspec]
 tp←D fns[;fnstypes]
 rk←D fns[;fnsranks]
 TYP←tp TypeRank rk
 tp←TS tp
 r←(E'$FNAME')Strepl¨ER1(mcb sis),fn
 r←(E'$FN')Strepl¨ER1(mcb r),mcb Raze⍉fns[;,fnsfn]
 r←(E'$XTYPE')Strepl¨ER1(mcb r),TYP[;,fnstypeslarg]
 r←(E'$YTYPE')Strepl¨ER1(mcb r),TYP[;,fnstypesrarg]
 r←(E'$ZTYPE')Strepl¨ER1(mcb r),TYP[;,fnstypesz]
 r←(E'$XT')Strepl¨ER1(mcb r),tp[;,fnstypeslarg]
 r←(E'$YT')Strepl¨ER1(mcb r),tp[;,fnstypesrarg]
 r←(E'$ZT')Strepl¨ER1(mcb r),tp[;,fnstypesz]
 r←(E'$CT')Strepl¨ER1(mcb r),fns[;,fnscomtyp]
 r←r SetFill PFATzt PFATProperty fns
