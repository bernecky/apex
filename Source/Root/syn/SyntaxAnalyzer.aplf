ast←x SyntaxAnalyzer y;c;sig;bt;state;states;i;stk;ns;Stn;Stf;Stx;Stl;Sta;Sto;Str;Std;stkp;src;tok;j;sig;astrows;clsassign;clsrbr;clslbr;clschar;clslamp;clsconj;clssep;clsfn;clsgoto;clsid;clsctl;clscolon;clssemic;clsadverb;clsnum;clslpar;clsqq;clsrpar;clsspace;clsexpn;clsqdnm;Stkstate;Stkvalue;Stktokcl;signal;lineno;st;StV;StS
 ⍝ Build abstract syntax tree for one line of a function.
 (ast lineno st)← x
 (src tok)← y
 SyntaxAnalyzerInit
 signal←clsspace ⍝ Anything except clsrescan
 :While c≥0
     fsm lineno
 :EndWhile
 :If (state∊Std,StN)        ⍝ Dyadic fn without result (aspm benchmark)
                            ⍝ UTIndexRef
     ast2eol
 :EndIf
 ⍝⍝ FIXME Need working assert for Dfn!  ('source program syntax error in line: ',src)assert stkp∊0 1
 :If ~state∊Stn,StS,Stx,StV ⍝ Ending state OK?
     snerr                 ⍝ Apparently not.
 :EndIf
