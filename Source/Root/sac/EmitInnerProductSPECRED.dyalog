 r←sis EmitInnerProductSPECRED fns;ffns;spec
 ⍝ Identify any special-case reductions for this inner product.
 ffns←fns
 ffns[;fnsfn]←E'sl'         ⍝ The reduction, an sich
 ffns[;fnslop]←fns[;fnslop]
 ffns[;fnsrop]←E''
 ffns[;fnsranks]←E'X10'     ⍝ This is OK for scalar f in f.g
 spec←,D(MarkSpecialCasesReduce ffns)[;fnsspec]
 sis←(E'$SPECRED')Strepl¨ER1(⍪sis),⍪E spec
 r←sis
