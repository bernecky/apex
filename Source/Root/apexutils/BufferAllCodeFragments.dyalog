 r←BufferAllCodeFragments frgs;txt
 ⍝ Collect code fragments
 txt←⍎,',fragments.',⍤1⊢'F'fragments.⎕NL 2 ⍝ Sorry about the execute...
 r←10 BreakCodeFragment txt
