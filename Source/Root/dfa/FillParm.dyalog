 r←parm FillParm y;ast;k;cv;p;asts;fil;j;cds;callerfn;calleefn;callsite
 ⍝ Fill function arg list ast chars from caller's ast rows
 cds←D y[0]
 fil←D y[1]
 callerfn←(D y[2])[0]
 calleefn←(D y[2])[1]
 callsite←D y[3]
 asts←D cds[calleefn]
 ast←D asts[ssaast]
 cv←(1↑⍴ast)⍴0
 p←~parm[;astclass]∊NULL
 cv[p/dfnlarg,dfnrarg]←1               ⍝ Ignore monadic left arg
 parm←p⌿parm                           ⍝ ditto
 parm[;asttarget]←(cv⌿ast)[;asttarget] ⍝ clobber parm names
 parm[;astvalue]←NULL                  ⍝ Don't prop values into subfns
 ⍝ Code blowup is huge (UTThorn gets to be 169 fns)
 ⍝ Also, SAC inlining should handle this. hohoho
 parm[;astPred]←E astPredLen⍴0
 k←cds CloneIfNeeded(E ast),(E parm),(E cv),E callerfn,calleefn,callsite
 cds←D k[0]
 calleefn←D k[1]                       ⍝ Callee may have been cloned
 asts←D cds[calleefn]                  ⍝ Refresh callee
 Checkem asts
 ast←D asts[ssaast]                    ⍝ Refresh callee
 k←astmerge(E ast),(E parm),E cv
 asts[ssaast]←k[0] ⋄ asts[ssacv]←E(D asts[ssacv])∨D k[1]
 Checkem asts
 r←cds
 r[calleefn]←E asts
