 z←PFATSystemVar ast;fnnm;q;hdr;cv;sysv;r
⍝# Return system variable usage for this fn
⍝# Result is list of shape (1↑⍴ast), containing list of
⍝# system vars for each line in the ast.
⍝ Note strong assumption about ordering of sysvars matching j
 cv←(dfainit ast)∧~ast[;astfn]∊NULL
 fnnm←jsym cv⌿ast[;astfn] ⍝ Compute primitive function names
 fnnm←('dm'[(D cv⌿ast[;astlarg])∊NULL]),¨fnnm
 r←PFAT[;PFATfn]⍳fnnm  ⍝ Table lookup for system var usage
 hdr←PFAT[0;]          ⍝ Column names
 q←'Q'∊¨hdr
 sysv←'⎕',¨1↓¨LC¨q/hdr
 r←((q/PFAT)⍪E,'0')[r;]
 r←r∊E,'1'
 z←(⍴cv)⍴E''
 z[cv/⍳⍴cv]←(ER1 r)replicate¨E sysv
