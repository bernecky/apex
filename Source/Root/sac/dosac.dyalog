 r←fldr dosac asts;TL;pathfrag;fragbuf
⍝# Emit object code for each compilation unit (CU)
⍝# Each tied file is a compilation unit.
 InitializeAST
 InitializeCodeGen
 InitializeCtl
 InitializeSSA
 InitializeTYPES
 TL←LC #.globals.TargetLanguage
 :If TL≡'sac'
     fragbuf←BufferAllCodeFragments #.globals.PathFrag
     r←fldr EmitOneCU asts
 :else
   r←asts
 :EndIf
