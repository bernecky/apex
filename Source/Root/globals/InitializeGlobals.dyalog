 InitializeGlobals Options;GITKLUDGE
⍝ Not a Dfn, because we set namespace globals

 PathDelim←Options GetOption'pathdelim=/'
 APEXPrefix←Options GetOption'apexprefix=A_'
 APLPrefix←Options GetOption'aplprefix=U_'
 PathApex←Options GetOption'pathapex=',(D 0⌷⎕SH'pwd'),PathDelim
 InlineLimit←'012345'⍳Options GetOption'inlinelimit=2' ⍝ InlineLimit=1 will inline leaves only
 TargetLanguage←Options GetOption'targetlanguage=sac'  ⍝  Or "plural"
 GITKLUDGE←'Source/Root/' ⍝    FIXME   this won't do for  MyCmds vstuff... 
 PathFrag←Options GetOption'pathfrag=',PathApex,GITKLUDGE,TargetLanguage,PathDelim,'fragments',PathDelim
 VisualizeDfa←'01'⍳Options GetOption'visualizedfa=0'
 PartialEvaluation←'01'⍳Options GetOption'partialevaluation=0'
 DisplayTemps←'01'⍳Options GetOption'displaytemps=0'
 DisplayVars←'01'⍳Options GetOption'displayvars=0'
 PathBench←Options GetOption'pathbench=benchmks',PathDelim
 OPTIONS←Options
