 InitializeGlobals Options
⍝ Not a Dfn, because we set namespace globals

 PathDelim←Options GetOption'pathdelim=/'
 APEXPrefix←Options GetOption'apexprefix=A_'
 APLPrefix←Options GetOption'aplprefix=U_'
 ApexPath←Options GetOption'apexpath=',D 0⌷⎕SH'pwd'
 TraceSyn←'01'⍳Options GetOption'tracesyn=0'
 TraceSsa←'01'⍳Options GetOption'tracessa=0'
 TraceDfa←'01'⍳Options GetOption'tracedfa=0'
 TraceSac←'01'⍳Options GetOption'tracesac=0'
 TracePlural←'01'⍳Options GetOption'traceplural=0'
 InlineLimiti←'012345'⍳Options GetOption'inlinelimit=2' ⍝ InlineLimit=1 will inline leaves only
 TargetLanguage←Options GetOption'targetlanguage=sac'  ⍝  Or "plural"
 PathFrag←Options GetOption'pathfrag=',ApexPath,PathDelim,'fragments',PathDelim,TargetLanguage
 VisualizeDfa←'01'⍳Options GetOption'visualizedfa=0'
 PartialEvaluation←'01'⍳Options GetOption'partialevaluation=0'
 DisplayTemps←'01'⍳Options GetOption'displaytemps=0'
 DisplayVars←'01'⍳Options GetOption'displayvars=0'
 BenchPath←Options GetOption'benchpath=benchmks',PathDelim
