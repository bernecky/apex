r←fldr dodfa asts;genws;PFAT;target;phasepause;debugdfa;PartialEvaluation;visualizedfa
 Initialize
 initializeAST
 initializeSSA
 initializeDEBUG
 InitializeFns
 phasepause←LC GetOption'phasepause' ⍝ Interphase pausing
 debugdfa←LC GetOption'debugdfa'     ⍝ Extensive ast check in dfa
 visualizedfa←LC GetOption'visualizedfa'
 PartialEvaluation←LC GetOption'partialevaluation'
 TargetLanguage←LC GetOption'output'
r←fldr dodfaOne asts
