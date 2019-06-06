 apex y;opts;fns;TargetLanguage;drive;PartialEvaluation
⍝ Set up compiler options
 ⎕FUNTIE ⎕FNUMS ⍝ Don't confuse later phases
 Initialize
⍝ Partial evaluation is broken as of 1999-04-23./rbe
⍝ So is sac output. Well, actually, it ain't writ yet.
 drive←GetOption'drive'
 TargetLanguage←GetOption'output'
 PartialEvaluation←GetOption'partialevaluation'
 phasepause←LC GetOption'phasepause' ⍝ Interphase pausing
 trace←'yes'≡3↑LC GetOption'tracesyn'
 debugphase←LC GetOption'debugsyn'
 fns←GetBlistFns y
 syn.dosyn fns
 ssa.dossa
 dfa.dodfa
 sac.dosac ⍝ We call all code generators, for no good reason
 plural9.doplural
