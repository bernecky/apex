 {trace} apex fldr;TargetLanguage;asts;fns;trace
⍝ Set up compiler options for compilation of folder fldr
 Initialize
 trace←1 ⍝ Noisy, eh?
 TargetLanguage←'sac'
 fns←GetBlistFns fldr
 asts←(fldr trace) syn.dosyn fns
 asts←(fldr trace) idioms.doidioms asts
 asts←(fldr trace) ssa.dossa asts
 asts←(fldr trace) dfa.dodfa asts
 asts←(fldr trace) sac.dosac asts ⍝ We call all code generators, for no good reason
 asts←(fldr trace) plural9.doplural asts
