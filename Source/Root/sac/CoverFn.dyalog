﻿r← fnm CoverFn fldr;fn;i
⍝ Build cover function to allow APL ws
⍝ to call APEX-generated code.
⍝ Ditto the ⎕na definer function.
 fn←BuildCoverFn fldr ⍝ This may not be needed
 ⍝⍝ 'PutFile error'assert i←fn PutFile fnm,'coverfn.fn'
 fn←BuildDefinerFn tn
 ⍝⍝'PutFile error'assert i←fn PutFile fnm,'definer.fn'
 fn←BuildMakefile tn
 ⍝⍝'PutFile error'assert i←fn PutFile fnm,'MAKEFILE'
 fn←BuildMainFile tn ⍝ Customized MAIN.C
 ⍝⍝ 'PutFile error'assert i←fn PutFile fnm,'main.c'
