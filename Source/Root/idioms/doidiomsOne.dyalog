 r←doidiomsOne asts;y;i;tn;ct;ast2;ast3;ast;genws;cds;cds2;cds3;i2;fnm
 ⍝ Perform idiom recognition on one compilation dataset
 fnm←astsFnName asts
 (fts ⎕TS),': Starting idiom recognition for: ',fnm
 asts←FindIdiomsOneFn asts
 Checkem asts
 r←asts
 (fts ⎕TS),': Idiom recognition complete for: ',fnm
