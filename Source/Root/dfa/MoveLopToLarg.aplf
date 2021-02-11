 r←MoveLopToLarg csd;cv2;i;ast;astr;cv;b
⍝ Move replicate/expand left operands to left arguments
 ast←D csd[ssaast]
 cv←ast[;astfn]∊ER1⍪'/⌿\⍀' ⍝ scan/reduce/expand/replicate
 cv←cv∧~ast[;astlop]∊NULL ⍝ Must be a lop
 cv←cv∧isnum ast[;astlop] ⍝ No primitives, please
⍝ If astlop points up, this is compress/replicate/expand
⍝ If it points down, this is scan/reduce, pointing to operand :PA
 cv←cv\(cv/⍳⍴cv)>D cv⌿ast[;astlop]
⍝ We now have either replicate/expand or we have
⍝ scan/reduce on a derived or defined fn.
 b←astclassDFN,astclassLFN,astclassMFN,astclassGFN
 i←D cv⌿ast[;astlop]
 cv←cv\~ast[i;astclass]∊b ⍝ Remove scan/reduce
 'Dyadic replicate!'assert∧/(cv⌿ast)[;astlarg]∊NULL
 i←cv/⍳⍴cv
 ast[i;astlarg]←ast[i;astlop]
 ast[i;astlop]←NULL
 cv2←(⍳1↑⍴ast)∊ast[i;astlarg]
 ast←cv2 PropArgs ast
 r←csd ⋄ r[ssaast]←E ast
