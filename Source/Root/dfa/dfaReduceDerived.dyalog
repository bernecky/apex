﻿ r←dfaReduceDerived y;ast;i;j;k;wl;c;astPA;tar;op;opargs;astop;opnd
 ⍝# Window reduce w/primitive operand
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊ER1⍪'/⌿'
 i←i∧~ast[;astlarg]∊NULL  ⍝ Dyadic reduce only
 j←(isnum ast[;astlop])∧~ast[;astlop]∊NULL
 i←i∧j
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i ⍝ Any work?
 ⍝ Treatment of monadic (f/y) vs dyadic ( x f/y):
 ⍝ Monadic: f's right rank is 0⌈¯1+⍴⍴y
 ⍝ Dyadic:  f's right rank is ⍴⍴y (and f is monadic!)
 ⍝ NB. This defn of window reduce is REALLY CUT, not APL2!
     :For op :In i/⍳⍴i ⍝ Do one at a time, as I'm feeling dumb today.
         opargs←,ast FindPA(E astlop),E op  ⍝ find f's arguments
         astPA←ast[opargs;]
         opnd←ast[op;astlop]   ⍝ f in f/y
         astPA[;astchar]←ast[2⍴D ast[op;astrarg];astchar]
  ⍝ If f result rank known and normal reduce, reduce rank by 1
         b←(~ast[op;astrank]∊NULL)∧ast[op;astlarg]∊NULL
         astPA[;astrank]←astPA[;astrank]-b
         astop←ast[,op;]    ⍝ If window-reduce, f is monadic
         astop[;astlarg]←((E NULL),E ast[op;astlarg])[b]
  ⍝ Reduce result is lamination of the cells
  ⍝ Except in Dyalog and APL2, which are wrong, but there ya go
         :If ~ast[opnd;astrank]∊NULL ⍝ Don't mess with unknown ranks
             astop[;astchar]←ast[opnd;astchar]
             astop[;astrank]←ast[opnd;astrank]+ast[astop[;astrarg];astrank]-1
⍝⍝⍝⍝ Dyalog APL treats left operand f as f/.
         :EndIf
         :If 1=ast[ast[op;astlarg];astxrho]
             astop[;astSpecCase]←E'ONEEL'
         :EndIf
         astPA[;astPred]←E astPredLen⍴0 ⍝ Predicates are dead
         astPA←(astPA⍪astop)[⍋opargs,op;]
         wl[opargs,op]←0 ⍝ Update worklist
         j←astmerge(E ast),(E astPA),E(⍳1↑⍴ast)∊opargs,op
         ast←D j[0] ⋄ wl←wl∨D j[1]
     :EndFor
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
