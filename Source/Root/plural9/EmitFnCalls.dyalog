﻿ r←cv EmitFnCalls y;ast;tn;cal;d;i;fo;fns;cvz;j;ssa;k
 ⍝# Emit function calls for one user-defined function
 ssa←D y[0]
 fns←D y[1]
 ast←D ssa[ssaast]
 cvz←(dfainit ast)∧ast[;astclass]∊astclassVARB
 tn←ast TargetName ast NoConstants ast[;asttarget]
⍝⍝⍝ tn←ast ConstantTargetName tn
 tn[¯1+(dfainit ast)⍳1]←E'' ⍝ Kill end marker
 ast←PropagateAdvConjParms ast
 cal←((1↑⍴fns),calcols)⍴E''
 cal[;caltarget]←dtb¨tn
 cal[;callop,calfn,calrop]←fns[;fnslop,fnsfn,fnsrop]
 cal[;caltypes,calranks]←fns[;fnstypes,fnsranks]
 k←(~fns[;fnsspec]∊E,'.')/⍳1↑⍴fns
 cal[k;calspec]←fns[k;fnsspec]     ⍝ Special case names
 ⍝ Special-case names are not always needed, but in some
 ⍝ cases they are, e.g., one call of EPIO when an arg is known
 ⍝ to be sorted. This means we have more nearly-identical
 ⍝ code fragments than
 ⍝ we like, but times are rough...
 cal[;callpar]←E,'('
 k←ast GenArg ast[;astlarg]
 cal[;callarg]←k
 cal[;calcomma]←ER1 mcb', '[D k≡¨E'']
 k←ast GenArg ast[;astrarg] ⍝ Append right argument
 cal[;calrarg,calrpar]←k,fns[;,fnsrpar]
 cvz←cvz∨~dfainit ast
 cal[(~cvz)/⍳⍴cvz;]←E,''
 cal←GenFragNamesSGI(E cal),E ast ⍝ Semiglobals into subfn
 cal←GenFragNamesSGO(E cal),E ast ⍝ Semiglobals out from subfn
⍝ k←MarkPAEntries ast
⍝ cal[k/⍳⍴k;]←E''                   ⍝ Kill :PA entries & referents
⍝ cv←cv∧~k
⍝ fns is the list of APL primitive and derived functions that
⍝ we have to emit eventually. Effectively "stdlib".
 j←(E ast),(E cv),(E fns),E cal
 j←EmitFnCallsConstants j               ⍝ Emit constants in front end of ast
 j←EmitFnCallsPrefix j                  ⍝ Clean up front end of ast
 j←EmitFOR j                            ⍝ Emit :For :EndFor
 j←EmitFnCallsIndex j                   ⍝ indexed ref and assign calls
 j←EmitFnCallsDyadicScalar j            ⍝ x+y and friends
 j←EmitFnCallsMonadicGenericPrimitive j ⍝ ~⍵
 j←EmitFnCallsDyadicEpioPrimitive j     ⍝ ⍺⍳⍵
 j←EmitFnCallsDyadicGenericPrimitive j  ⍝ ⍺⌽⍵, ⍺⍉⍵, a⍪⍵...
 j←EmitFnCallsTakeDrop j                ⍝ x↑y and x↓y
 j←EmitFnCallsMonadicMisc j             ⍝ ⍴⍵, ⍳⍵, €⍵  ←⍵ ⎕←⍵  ←⍞
 j←EmitFnCallsNiladicMisc j             ⍝ ⎕av, ⎕ts
 j←EmitFnCallsMonadicGrade j            ⍝ ⍋⍵ ⍒⍵
 j←EmitFnCallsAdverb j                  ⍝ +/⍵ +\⍵ ⍺/⍵ ⍺\⍵
 j←EmitFnCallsConjunction j             ⍝ ⍺+.×⍵
 j←EmitFnCallsFrom j                    ⍝ x{y
 j←EmitFnCallsLevDex j                  ⍝ x€y and x⊣y
 j←EmitFnCallsPA j                      ⍝ Kill :PA entries
 j←EmitFnCallsCommandLineFns j          ⍝ Command-line argv()
 j←EmitFnCallsDefinedFns j              ⍝ Defined fn calls AND assign
 j←EmitReturns j                        ⍝ Defined fns returns
 j←EmitFnCallsRaze j                    ⍝ cal now a vector
 ast←D j[0]
 cv←D j[1]
 fns←D j[2]
 cal←D j[3]
 r←(E E cal),(E ast),(E cv∧0),E fns
