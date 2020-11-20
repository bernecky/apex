 r←x doplural asts;TL;pathfrag;fragbuf;fldr;Options;trace
⍝# Emit object code for each compilation unit (CU)
⍝# Each tied file is a compilation unit.
 (fldr Options trace)←x
 Initialize
 InitializeCodeGen
 InitializeCtl
 TL←GetOption'targetlanguage'
 :If TL≡'plural'
     pathfrag←Options GetOption'apexpath'
     pathfrag←pathfrag,Options GetOption'pathfrag'
     pathfrag←pathfrag,TL,PathDelim
     fragbuf←BufferAllCodeFragments pathfrag
     r←fldr EmitOneCU asts
 :else
  r←asts
 :EndIf
