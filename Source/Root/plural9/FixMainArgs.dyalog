﻿ r←fns FixMainArgs ast
⍝ SAC generates niladic main() function. APEX may not,
⍝ depending on the valence of <main>.
⍝ This function alters non-niladic main functions in two ways:
⍝  1. It changes the function header to be niladic.
⍝  2. It introduces a function to define the arguments to main
⍝     based on the command-line arguments, as follows:
⍝      Monadic "main y" function: y = coerce(argv(1)).
⍝      Dyadic  "x main y" function: x = coerce(argv(1)).
⍝                                   y = coerce(argv(2)).
⍝ The coercion is from character string to
⍝ whatever the declared type of x and y are.
 r←ast
 :If ('main'≡D ast[dfnname;asttarget])
     r fns←dfnlarg FixMainArg(E ast),E fns
     r fns←dfnrarg FixMainArg(E r),E fns
 :EndIf
 r←(E r),E fns
