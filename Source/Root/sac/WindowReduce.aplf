 r←ast WindowReduce fns;cv;larg;spec;cases
⍝ Detect width-2 special case for window reduce
 cv←(ast[;astfn]∊ER1⍪'/⌿')∧~ast[;astlarg]∊NULL
 larg←cv⌿ast[;astlarg] ⍝ Window size
 cases←(E'2'),(E'¯2')
 spec←(E'WIDTH2'),(E'WIDTHN2'),E,'.'
 r←fns
 r[cv/⍳⍴cv;fnsspec]←spec[cases⍳ast[larg;astvalue]]
