﻿ z←BuildCoverFn tn;csds;ast;fnm;l;r;z;txt;nm;dnm
⍝ Create APL cover function for APEX-generated
⍝ code located in filetie tn
 z←'BUILD AN APL COVER FUNCTION HERE, PLEASE'
 →0


 csds←⎕FREAD tn,¯1+1↑1↓⎕FSIZE tn
 ast←D(D''⍴⌽csds)[ssaast] ⍝ Last csd is root fn
 fnm←D ast[dfnname;asttarget] ⍝ Definer fn name
 z←ast APL2000Results dfnres ⍝ Result
 l←ast APL2000Arg dfnlarg ⍝ Left arg if any
 r←ast APL2000Arg dfnrarg ⍝ Right arg
⍝ We don't handle semi-globals in/out this afternoon.
 dnm←'APEX',fnm ⍝ Definer fn
 txt←dnm,';i',NL
 txt←txt,'i←dnm(???)',NL
 txt←txt,l,((0≠⍴l)/','),r,','
 txt←txt,(D z[0]),'←)'' ⎕na ''',fnm,'''',NL
 z←txt
