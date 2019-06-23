 doidiomsOneFile tn;y;i;tn;ct;ast2;ast3;ast;genws;cds;cds2;cds3;fnm;i2
 ⍝ Perform idiom recognition on file tn
 fnm←,(⎕FNUMS=tn)⌿⎕FNAMES
 (fts ⎕TS),': Starting idiom recognition for: ',fnm
 cds←⎕FREAD¨tn,¨(1↑⎕FSIZE tn)+⍳|-/2↑⎕FSIZE tn ⍝ Compilation dataset
 cds←FindIdiomsOneFn¨cds
 Checkem¨cds
 i←cds fappend tn
 (fts ⎕TS),': Idiom recognition complete for: ',fnm
