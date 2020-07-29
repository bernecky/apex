 r←x dodfa asts;genws;PFAT;target;debugdfa;PartialEvaluation;visualizedfa;fldr;trace
 (fldr trace)←x
 Initialize
 InitializeAST
 InitializeSSA
 initializeDEBUG
 InitializeFns
 debugdfa←LC GetOption'debugdfa'     ⍝ Extensive ast check in dfa
 visualizedfa←LC GetOption'visualizedfa'
 PartialEvaluation←LC GetOption'partialevaluation'
 TargetLanguage←LC GetOption'output'
 r←fldr dodfaOne asts
