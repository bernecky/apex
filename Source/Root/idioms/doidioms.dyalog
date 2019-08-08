 r←x doidioms asts;genws;TargetLanguage;phasepause;debugidioms;PartialEvaluation;visualizeidioms;PartialEvaluation;fldr;trace
 (fldr trace)←x
 Initialize
 InitializeAST
 InitializeSSA
 phasepause←LC GetOption'phasepause'   ⍝ Interphase pausing
 debugidioms←LC GetOption'debugidioms' ⍝ Extensive ast check in idioms
 visualizeidioms←LC GetOption'visualizeidioms'
 PartialEvaluation←LC GetOption'partialevaluation'
 TargetLanguage←LC GetOption'output'
 r←doidiomsOne¨asts
