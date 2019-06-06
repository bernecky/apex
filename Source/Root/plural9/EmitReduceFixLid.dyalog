 r←EmitReduceFixLid fns;typ;i;b
 r←PFATlid PFATProperty fns
 ⍝ Correct maxbool(), minbool()
 typ←(D fns[;fnstypes])[;fnstypesrarg] ⍝ YTYPE
 typ←typ∊uc TYPES asttypeB
 b←(E'max$YTYPE()'),E'min$YTYPE()'
 i←(typ∧,r∊b)/⍳⍴typ        ⍝ Mark offending items
 r[i;]←((E,'1'),E,'0')[b⍳r[i;]]
