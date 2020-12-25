 r←fldr doplural asts;fragbuf
⍝# Emit object code for each compilation unit (CU)
⍝# Each tied file is a compilation unit.
 Initialize
 InitializeCodeGen
 InitializeCtl
 :If 'plural'≡ #.globals.TargetLanguage
     fragbuf←BufferAllCodeFragments #.globals.PathFrag
     r←fldr EmitOneCU asts
 :else
  r←asts
 :EndIf
