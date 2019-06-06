 SyntaxAnalyzerInit
 ⍝ Initialize syntax analyzer locals
 clsinit
 i←clsassign,clsconj,clsfn,clsgoto,clsadverb,clsqq
 i←i,clsctl,clssemic,clslbr,clsNilFn,clsqdnm,clsnum,clschar
 astrows←tok∊i
 ⍝ One ast entry for anything that can generate a value, and
 ⍝ One for each identifier.
 astp←''⍴⍴ast ⍝ Room for locals, args, result
 astrows←+/astrows∨>⌿0 1⌽D 2⍴E tok=clsid ⍝ Max entries in ast.
 ast←ast⍪astNewRows astrows ⍝ Pad with nulls
 c←¯1+''⍴⍴src ⍝ The "caret" or cursor.
 ⍝ Syntax analyzer states are:
 Stn←'n' ⍝ New statement, aka BOS (Beginning of statement)
 Stf←'f' ⍝ Function (and right argument) f ⍵
 Stx←'x' ⍝ Expression:           1 2 3   or (evaluated)
 Stl←'l' ⍝ Left bracket:         [
 Sta←'a' ⍝ Assign                ←
 Sto←'o' ⍝ Right operand to conjunction    0 1 ⍵
 Stc←'c' ⍝ Conjunction (dyadic operator)  +.×
 Std←'d' ⍝ Dyadic function w/stacked arguments: ⍺ f ⍵
 StN←'N' ⍝ Niladic function
 StV←'V' ⍝ Naked verb:            f
 StC←'C' ⍝ Naked Conjunction:     .
 StA←'A' ⍝ Naked adverb:          /
 Stz←'z' ⍝ Error:                 syntax error
 states←Stn,Stf,Stx,Stl,Sta,Sto,Stc,Std,StV,StC,StA,Stz,StN
 state←Stn ⍝ Start of statement
 stk←((1↑⍴ast),3)⍴E'' ⍝ Stack columns are: state, src value, token class
 Stkstate←0
 Stkvalue←1
 Stktokcl←2
 stkp←0 ⍝ Stack pointer
 clsinit ⍝ Initialize token classes
 GettValue←0   ⍝ Gett result indices
 GettClass←1
 GettLength←2
