 SyntaxAnalyzerInit;i;stkdepth;astrows
 ⍝ Initialize syntax analyzer locals
 clsinit
 i←clsassign,clsconj,clsfn,clsgoto,clsadverb,clsqq
 i←i,clsctl,clssemic,clslbr,clsNilFn,clsqdnm,clsnum,clschar
 c←¯1+''⍴⍴src ⍝ The "caret" or cursor.
 ⍝ Syntax analyzer states are:
 Sta←'a' ⍝ Assign                ←
 StA←'A' ⍝ Naked adverb:          /
 Stc←'c' ⍝ Conjunction (dyadic operator)  +.×
 StC←'C' ⍝ Naked Conjunction:     .
 Std←'d' ⍝ Dyadic function w/stacked arguments: ⍺ f ⍵
 Stf←'f' ⍝ Function (and right argument) f ⍵
 Stl←'l' ⍝ Left bracket:         [
 Stn←'n' ⍝ New statement, aka BOS (Beginning of statement)
 StN←'N' ⍝ Niladic function
 Sto←'o' ⍝ Right operand to conjunction    0 1 ⍵
 StS←'s' ⍝ Strand ( b c d)
 StV←'V' ⍝ Naked verb:            f
 Stx←'x' ⍝ Expression:           1 2 3   or (evaluated)
 Stz←'z' ⍝ Error:                 syntax error
 states←Sta,StA,Stc,StC,Std,Stf,Stl,Stn,StN,Sto,StS,StV,Stx,Stz
 state←Stn ⍝ Start of statement
 stkdepth←1+⍴tok ⍝ This is usually overkill
 stk←((stkdepth),3)⍴E'' ⍝ Stack columns are: state, src value, token class
 stkp←0 ⍝ Stack pointer
 Stkstate←0
 Stkvalue←1
 Stktokcl←2
 clsinit ⍝ Initialize token classes
 GettValue←0   ⍝ Gett result indices
 GettClass←1
 GettLength←2
