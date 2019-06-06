﻿ r←fns FnDefn ast;tp;dy;fn;fd;sg;tps;fr;hdr;fnrks;notmain;inlineme
 ⍝ Gen SAC fn defn for defined fn
 ast fns←fns FixMainArgs ast
 fn←D ast[dfnname;asttarget] ⍝ Defined fn name
⍝ Niladic, Monadic, Dyadic, result or no
 tp←dfnlarg,dfnrarg,dfnres ⍝ args, result ast indices
 dy←~ast[tp;asttarget]≡¨astNoFn
 args←D ast[dfnlarg,dfnrarg;asttarget] ⍝ Arg list
 tp←(ast[tp;,asttype])TypeRank ast[tp;,astrank]
 fnrks←(¯1⌽TypesBig)[1+ast[dfnlarg,dfnrarg,dfnres;asttype]]
 notmain←~fn≡'main' ⍝ Main is "special" in several ways
 ('int main() has bad result type: ',D tp[2])assert notmain∨tp[2]≡E'int'
 fn←fn,notmain/fnrks ⍝ No function type signature for main
 args←¯2↓,dy[0 1]⌿tp[0 1],(E' '),args,2 2⍴', '
 ⍝ Build fn header
 fd←(dy[2]/tp[2]),(E,' '),fn,(E,'('),args
 inlineme←1 ⍝ Inlining some apps (UTDScalarB) kills sac2c
 ⍝ (heap overflow, etc.), but logd slows down by 7X without it!
 ⍝ Leave room for someone to insert a pragma into the sac2c-killers
 ⍝ Otherwise, inline all non-main user-defined fns
 ⍝ Inlining slows down compile times a LOT (See saczilla bug#243)
 hdr←D Raze((inlineme∧notmain)/E'inline '),fd[0]
 fd←D Raze 1↓fd
 ⍝ Build header for incoming semiglobals
 sg←(SemiGlobalsMarkIn ast)⌿ast
 sg←ast KillQUADvarsFnDefn sg
 :If (~0∊⍴sg) ⍝ KLUDGE for stupid APL2 empty treatment
     tps←sg[;,asttype]TypeRank sg[;,astrank]
     sg←⍪ast TargetName sg[;asttarget]
     sg←¯1↓,tps,(E' '),sg,E','
     fd←fd,(('('≠¯1↑fd)/E','),sg
 :EndIf
 fd←D Raze⍉fd,E')'
 sg←SemiGlobalsMarkOut ast ⍝ Header for outgoing locals
 :If (~notmain)∧0≠∨/sg
     ⎕←'ERROR: Unlocalized variable(s) in function: ',ast[dfnname;asttarget]
     ⎕←sg⌿ast[;,asttarget]
 :EndIf
 :If (~1∊sg) ⍝ Kludge for stupid apl2 empties
     sg←''
 :Else
     tps←(sg⌿ast[;,asttype])TypeRank sg⌿ast[;,astrank]
     sg←D Raze,(',',¨tps),E,NL
 :EndIf
 r←(squeeze hdr,sg,fd,NL),'{ '
 'stupid enclosed arrays'assert∧/r∊⎕AV
 r←(E r),(E fns),E ast
