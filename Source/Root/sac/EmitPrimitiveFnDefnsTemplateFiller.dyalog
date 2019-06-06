﻿ r←sis EmitPrimitiveFnDefnsTemplateFiller fns;i;typ;TYP;fn;s
 ⍝# Template filler for code fragments sis
 s←fns[;fnsspec]
 fns[(s∊E,'.')/⍳⍴s;fnsspec]←E''
 fn←⍪Raze⍉fns[;fnslop,fnsfn,fnsrop,fnstypes,fnsspec]
 typ←D fns[;fnstypes]
 TYP←TSAC typ
 typ←TS typ
 r←(E'$FNAME')Strepl¨ER1(⍪sis),fn
 r←(E'$FN')Strepl¨ER1(⍪r),⍪Raze⍉fns[;,fnsfn]
 r←(E'$XTYPE')Strepl¨ER1(⍪r),TYP[;,fnstypeslarg]
 r←(E'$YTYPE')Strepl¨ER1(⍪r),TYP[;,fnstypesrarg]
 r←(E'$ZTYPE')Strepl¨ER1(⍪r),TYP[;,fnstypesz]
 r←(E'$XT')Strepl¨ER1(⍪r),typ[;,fnstypeslarg]
 r←(E'$YT')Strepl¨ER1(⍪r),typ[;,fnstypesrarg]
 r←(E'$ZT')Strepl¨ER1(⍪r),typ[;,fnstypesz]
 r←(E'$CT')Strepl¨ER1(⍪r),fns[;,fnscomtyp]
 r←r SetFill PFATzt PFATProperty fns
