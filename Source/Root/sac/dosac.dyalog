 r←fldr dosac asts;TL;fragbuf
⍝# Emit object code for each compilation unit (CU)
⍝# Each tied file is a compilation unit.
 InitializeAST
 InitializeFragments
 InitializeCtl
 InitializeSSA
 InitializeTYPES
 InitializePFAT
 TL←LC #.globals.TargetLanguage
 :If TL≡'sac'
     fragbuf←BufferAllCodeFragments #.globals.PathFrag
     r←fldr EmitOneCU asts
 :Else
     r←asts
 :EndIf
