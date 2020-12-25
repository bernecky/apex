 InitializeCodeGen
⍝ Initialization for code generator
 frg←0 2⍴' '
 jsymbols←JSYM
 InitializeFragments
 PFAT←BuildPFAT #.globals.TargetLanguage
