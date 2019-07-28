 apex fldr;opts;TargetLanguage;drive;PartialEvaluation;asts
⍝ Set up compiler options for compilation of folder fldr
 Initialize
⍝ Partial evaluation is broken as of 1999-04-23./rbe
⍝ So is sac output. Well, actually, it ain't writ yet.
 drive←GetOption'drive'
 TargetLanguage←GetOption'output'
 PartialEvaluation←GetOption'partialevaluation'
 phasepause←LC GetOption'phasepause' ⍝ Interphase pausing
 trace←'yes'≡3↑LC GetOption'tracesyn'
 debugphase←LC GetOption'debugsyn'
 ⍝⍝⍝fldr←fldr,(PathDelim≠¯1↑fldr)/PathDelim
 asts←fldr syn.dosyn GetBlistFns fldr
 asts←fldr idioms.doidioms asts
 asts←fldr ssa.dossa asts
 asts←fldr dfa.dodfa asts
 asts←fldr sac.dosac asts ⍝ We call all code generators, for no good reason
 asts←fldr plural9.doplural asts
