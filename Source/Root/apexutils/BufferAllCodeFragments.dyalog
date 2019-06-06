 r←BufferAllCodeFragments frgs;fnms;frnm
 ⍝ Buffer all code fragments, to speed up code generation
 fnms←ls frgs,'*.frg'
 frnm←(D FileNameBreak¨fnms)[;1] ⍝ just thorn, mmisc, etc.
 r←D 10 GetCodeFragment¨frnm
