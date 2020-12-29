﻿ z←BuildMakefile tn;csds;ast;fnm;txt
⍝ Create Makefile for APEX-generated
⍝ code located in filetie tn
 z←''
 →0 ⍝ NOT USED IN LINUX (today)
 csds←⎕FREAD tn,¯1+1↑1↓⎕FSIZE tn
 ast←D(D''⍴⌽csds)[ssaast] ⍝ Last csd is root fn
 fnm←D ast[dfnname;asttarget] ⍝ Root fn name
 txt←'# Makefile built by APEX at: ',(fts ⎕TS),NL
 txt←txt,'# for module: ',(,(⎕FNUMS=tn)/⎕FNAMES),NL
 txt←txt,'TARGET=',fnm,NL
 txt←txt,GetFileChar #.globals.PathFrag,'makefile.skl'
 z←txt
