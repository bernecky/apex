 asts←Options apex fldr;defaultOpts;Opts
  ⍝  Compile code in folder fldr with Options
  ⍝ Establish default Option settings
 defaultOpts←'targetlanguage=sac trace=0 '
 Opts←defaultOpts,Options
 #.globals.Initialize Opts
 fns←GetBlistFns fldr

 ⍝  Invoke each compiler phase
 asts←fldr #.syn.dosyn fns
 asts←fldr #.idioms.doidioms asts
 asts←fldr #.ssa.dossa asts
 asts←fldr #.dfa.dodfa asts

 ⍝  Call appropriate code generator
 :Select #.globals.TargetLanguage
 :Case 'sac'
     asts←fldr #.sac.dosac asts
 :Case 'plural'
     asts←fldr #.plural9.doplural asts
 :EndSelect
 asts←'' ⍝ All true results are files
