 r←x dosac asts;TL;pathfrag;fragbuf;fldr;Options;trace
⍝# Emit object code for each compilation unit (CU)
⍝# Each tied file is a compilation unit.
 (fldr Options trace)←x
 Initialize
 InitializeCodeGen
 InitializeCtl
 TL←LC GetOption'output'
 :If TL≡'sac'
     pathfrag←LC GetOption'apexpath'
     pathfrag←pathfrag,LC GetOption'pathfrag'
     pathfrag←pathfrag,TL,PathDelim
     fragbuf←BufferAllCodeFragments pathfrag
     r←fldr EmitOneCU asts
 :else
   r←asts
 :EndIf
