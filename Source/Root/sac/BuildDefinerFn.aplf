 z←BuildDefinerFn tn;csds;ast;fnm;l;r;z;txt;nm;dnm;er
⍝ Create APL definer function for APEX-generated
⍝ code located in filetie tn
 csds←⎕FREAD tn,¯1+1↑1↓⎕FSIZE tn
 ast←D(D''⍴⌽csds)[ssaast] ⍝ Last csd is root fn
 fnm←ast[dfnname;asttarget] ⍝ Root fn name
 z←ast APL2000Results dfnres ⍝ Result
 l←ast APL2000Arg dfnlarg ⍝ Left arg if any
 r←ast APL2000Arg dfnrarg ⍝ Right arg
⍝ We don't handle semi-globals in/out this afternoon.
 nm←D ast[dfnname;asttarget] ⍝ Definer fn name
 dnm←'APEX',nm ⍝ The APEX-version of nm.
 txt←'Define',dnm,';i',NL
 txt←txt,'i←⎕ex''',dnm,'''',NL ⍝ Erase any old defn
 txt←txt,'i←''DLL ',(D z[0]),'←',nm,'.main('
 txt←txt,l,((0≠⍴l)/','),r
 er←D z[1]
 er←((0≠⍴er)/','),er,(0≠⍴er)/'←'
 txt←txt,er,')'' ⎕na ''',dnm,'''',NL
 txt←txt,'→(i≠1)⍴.1 ⍝ Assertion that ⎕na worked',NL
 z←txt
