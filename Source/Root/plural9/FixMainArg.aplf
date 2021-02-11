 r←largrarg FixMainArg y;ast;fns;lr;rowno;argv;onetwo;nr;newfns;ren;fn
⍝ Repair left/right argument to <main> function.
⍝ 1. Introduce new local definition for argument.
⍝ 2. Remove argument from function header.
⍝ 3. Introduce function call to argv() reader.
⍝ 4. Introduce function call to string-to-APEX-type coercer.
 ast←D y[0]
 fns←D y[1]
 r←ast
 :If (~astNoFn≡ast[largrarg;asttarget])
   ⍝ Move argument to locals
     lr←ast[,largrarg;]
     r←ast astInsertSymbols ast[,largrarg;]
     r[largrarg;]←astNewRows 1
     r[largrarg;asttarget]←astNoFn
     ren←⍳1↑⍴r
     ren[largrarg]←r[;asttarget]⍳lr[;asttarget]
     r←ren RenumberAst r ⍝ Move argument refs
     ⍝ Generate argv symbol table entry
     nr←astNewRows 1
     fn←E'CommandLineArgv'
     nr[0;asttarget]←fn
     nr[0;astclass]←E astclassMFN
     nr[0;astrank]←E 0
     nr[0;astshape]←E⍳0
     nr[0;astxrho]←E 1
     ⍝ garbage r←r astInsertSymbols nr
   ⍝ Generate coercion and assignment
     lr[;asttarget]←E r[;asttarget]⍳lr[0;asttarget]
     lr[;astfn]←fn
     onetwo←largrarg-dfnlarg
     onetwo←onetwo-ast[dfnlarg;asttarget]≡astNoFn
     onetwo←((E,'1'),E,'2')[onetwo]
     lr[;astrarg]←E r[;asttarget]⍳onetwo
     r←((dfainit r)⍳1)astInsertRows(E r),E lr
    ⍝ Generate fns entry
     newfns←(fns⍪(1,fnscols)⍴E'')[,0;]
     newfns[;fnsfn]←fn
     newfns[;fnstypes]←E'XI',TS Types[D lr[;asttype]]
     newfns[;fnsranks]←E'X0',RANKS D lr[;astrank]
     fns←fns⍪newfns
 :EndIf
 r←(E r),E fns
