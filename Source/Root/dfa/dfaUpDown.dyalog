 r←dfaUpDown cds;sf;sfl;al;j;k;fil;lr;m;n;st;wl;curfn;ast;p;parm;asts;subfn;callerfn;calleefn;callsite;ct;cv;tx
 ⍝ Propagate dfa info up/downwards in calling tree.
 ⍝ asts is list of ssa data, one per defined fn
 ⍝ ct is calling tree, in same order as asts
 ⍝ Result includes worklists
 ⍝ This probably can be done in parallel,
 ⍝ but for now do it serially.
 Trace'dfaUpDown started'
 Checkem¨cds
 :For callerfn :In ⍳⍴cds
     ct←BuildCallingTree cds
     sfl←D ct[0]          ⍝ Function name list
     al←D ct[1]           ⍝ Adjacency list of who calls who
     sf←al[callerfn;]/sfl ⍝ We call these fns
     asts←D cds[callerfn] ⍝ Caller's ssa data
     ast←D asts[ssaast]   ⍝ Caller's ast
     fil←sfl⍳ast[,D(ast[CallSites ast;])[;astfn];asttarget] ⍝ Callee indices
  ⍝ Propagate caller's array morph into its subfns
     :For j :In ⍳⍴fil              ⍝ One call at a time
         callsite←(CallSites ast)[j] ⍝ Caller ast index of subfn call
         'TRACEdfa Trace tx←'Propagating astlarg,astrarg from : '
         tx←tx,(D ast[dfnname;asttarget]),' into: '
         tx←tx,D ast[ast[callsite;astfn];asttarget]
         'TRACEdfa Trace tx
         lr←D ast[callsite;astlarg,astrarg] ⍝ Left, right subfn args
         n←lr∊NULL                 ⍝ Missing args
         :If 0∊n                   ⍝ Propagate into subfns if any args
             parm←(~n)⍀ast[(~n)/lr;]
             parm[n/⍳⍴n;]←NULL
             cds←parm FillParm(E cds),(E fil),(E callerfn,fil[j]),callsite
             Checkem¨cds
         :EndIf
         asts←D cds[callerfn]  ⍝ Refresh caller's ast now.
         ast←D asts[ssaast]    ⍝ This is needed because fn cloning
                               ⍝ may have changed caller's ast.
         callsite←(CallSites ast)[j]   ⍝ Fn cloning moves subfn call
   ⍝ Semiglobals from us to the subfn
         n←ast ParmList D ast[callsite;astparms] ⍝ Subfn args
         cds[fil[j]]←E(D cds[fil[j]])SemiGlobalInArgs ast[n;]
         Checkem¨cds
         asts←D cds[callerfn]  ⍝ Refresh caller's ast now
         ast←D asts[ssaast]
         wl←D asts[ssacv]
   ⍝ Propagate subfn's array morphology to caller
         n←(D(D cds[fil[j]])[ssaast])[,dfnres;] ⍝ Callee explicit result
         p←~(⍳¯1↑⍴ast)∊astchar ⍝ Preserve boring items of caller's ast
         p←p/⍳⍴p
         cv←(⍳1↑⍴ast)∊callsite
         n[;p]←cv⌿ast[;p] ⍝ avoid astmerge assertion
         p←astmerge(E ast),(E n),E cv
         ast←D p[0]
         wl←wl∨D p[1]
         Checkem(E'?'),E ast
   ⍝ Semiglobals from subfn to caller
         n←(D cds[fil[j]])[ssaast] ⍝ Subfn ast
         n←ast SemiGlobalsOut(E callsite),n  ⍝ SG-out from call at ast[m[j;]]
         ast←D n[0]
         wl←wl∨D n[1]
         asts[ssacv]←E wl
         asts[ssaast]←E ast
         Checkem(E'?'),(E ast),(E wl)
         ct←D asts[ssacfg]               ⍝ CFG may have changed
         cds[callerfn]←E asts
     :EndFor
     cds[callerfn]←E asts
     Checkem¨cds
 :EndFor
 r←cds
 Trace'dfaUpDown ended'
