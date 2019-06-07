 r←x SyntaxAnalyzer y;c;sig;bt;state;states;i;stk;ns;Stn;Stf;Stx;Stl;Sta;Sto;Str;Std;ast;astp;stkp;src;tok;j;sig;astrows;clsassign;clsrbr;clslbr;clschar;clslamp;clsconj;clssep;clsfn;clsgoto;clsid;clsctl;clscolon;clssemic;clsadverb;clsnum;clslpar;clsqq;clsrpar;clsspace;clsexpn;clsqdnm;Stkstate;Stkvalue;Stktokcl;signal;lineno;st
 ⍝ Build abstract syntax tree for one line of a function.
 (ast lineno st)← x
 (src tok)← y
 SyntaxAnalyzerInit
 signal←clsspace ⍝ Anything except clsrescan
 :While c≥0
     fsm lineno
 :EndWhile
 :If (state=Std)        ⍝ Dyadic fn without result (aspm benchmark)
     ast2lbr               ⍝ Treat as if it was [x foo y...
 :EndIf
 ⍝⍝ FIXME Need working assert for Dfn!  ('source program syntax error in line: ',src)assert stkp∊0 1
 r←(astp,¯1↑⍴ast)⍴ast   ⍝ Trim ast
 :If ~state∊Stn,Stx,StV ⍝ Ending state OK?
     snerr                 ⍝ Apparently not.
 :EndIf
