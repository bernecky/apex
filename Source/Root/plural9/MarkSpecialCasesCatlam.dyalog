 r←MarkSpecialCasesCatlam fns;cv;spec;cases;cv2
⍝# Generate special case names for catenate/laminate
 cv←(ast[;astfn]∊ER1 mcb',⍪')∧IsDyadic fns
 spec←(D cv⌿fns[;fnsranks])[;fnsrankslarg,fnsranksrarg]
 spec←'0123456789'⍳spec
 cv2←spec∧.≠0        ⍝ Ignore SxA, AxS
 spec←1+×-/cv2⌿spec
 cv←cv\cv2
 r←fns
 cases←(E'RG'),(E,'.'),E'LG' ⍝ Left-rank greater, same, right-rank greater
 r[cv/⍳⍴cv;fnsspec]←cases[spec]
