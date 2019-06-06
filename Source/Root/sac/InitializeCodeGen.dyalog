 TargetLanguage←InitializeCodeGen
⍝ Initialization for code generator
 frg←0 2⍴' '
 jsymbols←JSYM
 InitializeFragments
 TargetLanguage←GetOption'output'
 PFAT←BuildPFAT TargetLanguage
⍝ Prefix for all APEX-generated names
 APEXPrefix←GetOption'APEXPrefix'
