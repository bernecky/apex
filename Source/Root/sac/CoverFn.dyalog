 fnm CoverFn tn;fn;i
⍝ Build cover function to allow APL ws
⍝ to call APEX-generated code.
⍝ Ditto the ⎕na definer function.
 fn←BuildCoverFn tn ⍝ This may not be needed
 ⍝⍝ 'PutFile error'assert i←fn PutFile fnm,'coverfn.fn'
 fn←BuildDefinerFn tn
 ⍝⍝'PutFile error'assert i←fn PutFile fnm,'definer.fn'
 fn←BuildMakefile tn
 ⍝⍝'PutFile error'assert i←fn PutFile fnm,'MAKEFILE'
 fn←BuildMainFile tn ⍝ Customized MAIN.C
 ⍝⍝ 'PutFile error'assert i←fn PutFile fnm,'main.c'
