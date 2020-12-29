 z←BuildMainFile tn;csds;ast;fnm;txt;sr
⍝ This is not supported for SAC. Someday Real Soon Now.. rbe 2004-05-24
 z←''
 →0
⍝ Create MAIN.C for APEX-generated
⍝ code located in filetie tn
 csds←⎕FREAD tn,¯1+1↑1↓⎕FSIZE tn
 ast←D(D''⍴⌽csds)[ssaast] ⍝ Last csd is root fn
 fnm←D ast[dfnname;asttarget] ⍝ Root fn name
 sr←D ast[dfnres;astrank] ⍝ Result rank
 txt←(BuildComment'main.c built by APEX at: ',fts ⎕TS),NL
 txt←txt,(BuildComment'for module: ',(,(⎕FNUMS=tn)/⎕FNAMES)),NL
 txt←txt,'#define EP ',fnm,NL ⍝ Entry point name
 txt←txt,'#define ARG0 ',D TC D ast[dfnrarg;asttype] ⍝ First argument descriptor
 txt←txt,NL
 txt←txt,'#define RESULT0 ',D TC D ast[dfnres;asttype] ⍝ Result descriptor
 txt←txt,NL
⍝ Pick skeleton based on result rank (ugh!)
 txt←txt,GetFileChar #.globals.PathFrag,'main',((sr=0)/'scal'),'.skl'
 z←txt
