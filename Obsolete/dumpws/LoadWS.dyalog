 LoadWS d;fns;PathDelim;∆LF;txt;∆PE
⍝ Load and fix functions in directory d from d/blist.cu
 PathDelim←'/' ⍝ Take that, Mr. Bill
 ∆PE←{⎕ML←0 ⋄ ⍺⊂⍵}
 ∆LF←⎕AV[2] ⍝ Linux
 fns←RFile d,PathDelim,'blist.cu'
 fns←¯1↓¨(¯1⌽fns=∆LF)∆PE fns
 fns←(~fns≡¨⊂,∆LF)/fns ⍝ Ignore empty rows
 fns←(⊂d,PathDelim),¨fns
 txt←RFile¨fns
 txt←⊃¨¯1↓¨¨(¯1⌽¨txt=¨∆LF)∆PE¨txt
 ⎕FX¨txt
 ⎕EX¨'LoadWS' 'DumpWS' 'RFile' 'WFile'
