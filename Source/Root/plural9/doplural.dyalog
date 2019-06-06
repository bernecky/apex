 doplural;TargetLanguage;fnm;pathfrag;fragbuf
⍝# Emit object code for each compilation unit (CU)
⍝# Each tied file is a compilation unit.
 Initialize
 InitializeCodeGen
 InitializeCtl
 TargetLanguage←GetOption'target'
 :If TargetLanguage≡'plural'
     pathfrag←GetOption'apexpath'
     pathfrag←pathfrag,GetOption'pathfrag'
     pathfrag←pathfrag,TargetLanguage,PathDelim
     fragbuf←BufferAllCodeFragments pathfrag
     :If ×⍴⎕FNUMS
         EmitOneCU¨⎕FNUMS
         fnm←⎕FNAMES
         LastFile←,fnm ⍝ Debug convenience only...
     :EndIf
     ⎕FUNTIE ⎕FNUMS
 :EndIf
