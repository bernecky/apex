 r←ast GenerateFnHeader i;j;def
 j←i⌿D(GenFragNames ast)[0] ⍝ Fn name
 j←Raze⍉j[;⍳5]
 def←ast GenDefns i ⍝ Gen parm defns for i⌿ast.
 def←(3 1⍴(E'(',NL,'  x'),(E'  y'),(E'  returns ')),def/
 def←def,3 1⍴(2⍴E';',NL),E')',NL,'  '
 def←Raze Raze⍉def ⍝ parameters
 r←j,def
