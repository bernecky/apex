﻿ r←dfaIp y;ast;wl;i;k;m;n;p;f;g;fAP;gPA;nast;fnsf;args;op
 ⍝# DFA for inner products f.g
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊E,'.' ⍝ Locate ip and op.
 op←i FindOperands ast  ⍝ Find f and g
 k←~ast[op[;0];astfn]∊E,'∘' ⍝ Ignore outer product
 i←i\k
 op←k⌿op
 wl←wl∧~i                   ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 i←i∧∧/~ast[;astlarg,astrarg]∊NULL ⍝ Both args known?
 :If 1∊i ⍝ Any work?
 ⍝ First, propagate data down, from f.g into f and g
     args←(i⌿ast)[;astlarg,astrarg] ⍝ f.g arguments
     f←op[;0]
     g←op[;1]
     gPA←ast[g;astlarg,astrarg]
     fPA←ast[f;astlarg,astrarg]
     nast←ast
 ⍝ Set up g :PA arguments
     nast[gPA;asttype]←ast[args;asttype]
     nast[gPA;astrank]←E 1 ⍝ All g-arguments are V-V
 ⍝ If we know f or g's shapes, we could set up astshape, etc. FIXME
 ⍝ Set up f :PA arguments
 ⍝ Can set f asttype if we know g asttype
     fnsf←((1↑⍴fPA),fnscols)⍴E'' ⍝ Fake up dyadic scalar fns entries for f
     fnsf[;fnsfn]←jsym ast[f;astfn]
     m←D ast[g;asttype]       ⍝ Might not know type yet...
     p←m≠NULL
     fnsf[p/⍳⍴m;fnstypes]←ER1 3/mm TypesBig[p/m] ⍝ ok that ztype wrong
     nast[fPA;asttype]←2/⍪m ⍝ f arg types are g result types
     nast[fPA;astrank]←E 1 ⍝ f-reduce args always vectors
 ⍝
 ⍝ Now, propagate info from f and g back into f.g
 ⍝ Set f.g result rank. Don't need f and g, if they're scalar fns
     m←ast[args;astrank] ⍝ larg and rarg ranks
     p←∧/~m∊NULL      ⍝ Both ranks known
     m←0⌈¯2++/1⌈D m   ⍝ ¯1+argranks
     nast[p/i/⍳⍴i;astrank]←ER0¨p/m ⍝ Set result rank
     m←ast[args;astshape]     ⍝ Set result shape from arg shapes
     p←∧/~m∊NULL              ⍝ Both shapes known
     n←p⌿m
     n←(¯1↓¨n[;0]),¨1↓¨n[;1]  ⍝ Classical f.g result shape
     nast[p/i/⍳⍴i;astshape]←n ⍝ Result shape
     nast[p/i/⍳⍴i;astxrho]←1↓×/¨0,n ⍝ Silliness to avoid empty
 ⍝ Set result type from result type of f
     nast[i/⍳⍴i;asttype]←ast[f;asttype]
     nast[i/⍳⍴i;astPred]←E astPredLen⍴0 ⍝ Destroy preds. Fix later FIXME
     i[fPA,gPA,op]←1          ⍝ Changed rows
     nast←astmerge(E ast),(E i⌿nast),E i
     ast←D nast[0] ⋄ wl←wl∨D nast[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
