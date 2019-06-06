 r←ast GenerateTraceStatements y;vars;cv;txt;rk
 ⍝ Run-time trace display
 cv←D y[0]
 vars←D y[1]
 txt←'Fn: ',(D ast[dfnname;asttarget]),' '
 rk←cv⌿ast[;astrank]
 r←(E txt),¨vars,¨(E' rank='),¨⍕¨rk
 r←r,¨' '
 ⍝ Brackets in next line to get around sac2c crash to/from scalar
 r←(E'show(tochar("'),¨r,¨(E'")); show(['),¨vars,¨E']);',NL
