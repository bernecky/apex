 r←fldr dosac asts;TL;pathfrag;fragbuf
⍝# Emit object code for each compilation unit (CU)
⍝# Each tied file is a compilation unit.
 Initialize
 InitializeCodeGen
 InitializeCtl
 TL←LC #.globals.TargetLanguage
 :If TL≡'sac'
     fragbuf←BufferAllCodeFragments #.globals.PathFrag
     r←fldr EmitOneCU asts
 :else
   r←asts
 :EndIf
