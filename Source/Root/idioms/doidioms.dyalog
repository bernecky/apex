 r←fldr doidioms asts;genws;TargetLanguage;phasepause;debugidioms;PartialEvaluation;visualizeidioms;PartialEvaluation
 Initialize
 initializeAST
 initializeSSA
 phasepause←LC GetOption'phasepause'   ⍝ Interphase pausing
 debugidioms←LC GetOption'debugidioms' ⍝ Extensive ast check in idioms
 visualizeidioms←LC GetOption'visualizeidioms'
 PartialEvaluation←LC GetOption'partialevaluation'
 TargetLanguage←LC GetOption'output'
 r←doidiomsOne¨asts
