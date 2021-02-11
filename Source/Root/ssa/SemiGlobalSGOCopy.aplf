 r←SemiGlobalSGOCopy cds;ast;cv;astr
⍝# Copy SGOs to end of ast, so that we can
⍝# find their SSA name at the exit from the fn.
 ast←D cds[ssaast]
 cv←ast[;astscope]∊astscopeSGO+0,astscopeSGI ⍝ Mark SGO
 astr←astNewRows+/cv
⍝ Mark implicit results
 astr[;astfn]←E':RI' ⍝ Generate new assigns at end
 cv←ER0 cv/⍳⍴cv
 astr[;asttarget]←cv
 astr[;astrarg]←cv
 ast←(¯1 0↓ast)⍪astr⍪ast[¯1+1↑⍴ast;] ⍝ AppendRE nonsense...
 r←cds ⋄ r[ssaast]←E ast
