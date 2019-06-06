 r←fn2ascii fn;b
⍝ Generate the APLASCII representation of the
⍝ function named fn
 r←APL2ASCII ⎕CR fn
 b←,(⌽∨\⌽r≠' '),1 ⍝ Mark trailing blanks, note cr
 r←b/,r,NL
