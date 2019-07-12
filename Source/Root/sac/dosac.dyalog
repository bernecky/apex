 r←fldr dosac asts;TargetLanguage;pathfrag;fragbuf
⍝# Emit object code for each compilation unit (CU)
⍝# Each tied file is a compilation unit.
 Initialize
 InitializeCodeGen
 InitializeCtl
 TargetLanguage←LC GetOption'output'
 :If TargetLanguage≡'sac'
     pathfrag←LC GetOption'apexpath'
     pathfrag←pathfrag,LC GetOption'pathfrag'
     pathfrag←pathfrag,TargetLanguage,PathDelim
     fragbuf←BufferAllCodeFragments pathfrag
     r←fldr EmitOneCU asts
 :else
   r←asts
 :EndIf
