 DumpWS p;fns;txt;fnms;PathDelim;∆LF;∆dtb;∆Raze
⍝ Dump contents of current workspace into folder p,
⍝ one file per function. Variables are ignored!
⍝ Also writes a manifest, blist.cu.
 fns←⎕NL 3
 PathDelim←'/' ⍝ Take that, Mr. Bill
 ∆LF←⎕AV[2] ⍝ Linux Linefeed/newline
 ∆dtb←{(⌽∨\⌽⍵≠' ')/⍵}
 ∆Raze←∊

 fns←∆dtb¨⊂[1]fns
 fns←(~fns∊'DumpWS' 'LoadWS' 'RFile' 'WFile')/fns
 txt←⎕NR¨fns
 txt←∆Raze¨txt,¨¨∆LF
 fns←fns,¨⊂'.ufn'
 fnms←(⊂p,PathDelim),¨fns
 :If ×⍴fns ⍝ Empty array joke
     WFile¨⊂[1]fnms,((⍴txt),1)⍴txt
 :EndIf
 fns←∆Raze fns,¨∆LF
 WFile(p,PathDelim,'blist.cu')fns
