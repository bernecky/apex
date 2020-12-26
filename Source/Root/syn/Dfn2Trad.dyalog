 Dfn2Trad←{
 ⍝ Convert Dfn to TradFn
     fnm←DfnName ⍵ ⍝ Get function name, if any
     fns←PathNoExtension¨PathFileName¨⍺ ⍝ Need all fn names as global, non-locals
     outerfn←dbr ⍵
     dfn←vtom NL,1↓(' ',NL)dtis(' ',NL)dlis(⍴fnm)↓dlb NL mtov outerfn
     outerfn←D(isDfn outerfn)⌷(E outerfn),E dfn
     (outerfn innerfns fns)←Dfn2TradTacit(outerfn''fnm fns)
     outerfn←(D outerfn)Dfn2TradTacitOne(fnm fns)
     (dbr¨#.arrayutils.DeleteMultipleBlanks¨(outerfn,innerfns))
 }
