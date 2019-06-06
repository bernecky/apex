 r←ZapField1 txt;b
⍝ Remove first field in text matrix txt
⍝ Field must start with non-blank
 b←,∨\txt∊' ',TAB
 r←rtnb(⍴t)⍴b\b/,txt
