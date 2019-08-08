 r←x doplural asts;TargetLanguage;pathfrag;fragbuf;fldr;trace
⍝# Emit object code for each compilation unit (CU)
⍝# Each tied file is a compilation unit.
 (fldr trace)←x
 Initialize
 InitializeCodeGen
 InitializeCtl
 TargetLanguage←GetOption'target'
 :If TargetLanguage≡'plural'
     pathfrag←GetOption'apexpath'
     pathfrag←pathfrag,GetOption'pathfrag'
     pathfrag←pathfrag,TargetLanguage,PathDelim
     fragbuf←BufferAllCodeFragments pathfrag
     r←fldr EmitOneCU asts
 :else
  r←asts
 :EndIf
