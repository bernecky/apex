 snaAsub;astr;i;b;k;m;Pop;j
 ⍝ Emit the derived function.
 j←stkpop 3 ⍝ Pop the lop, conj, rop
 astr←,astNewRows 1
 astr[astlop,astfn,astrop]←j[;1]
 astr[asttarget]←E astp
 astr[astclass]←E astclassLFN ⍝ Local fn
 m←astp
 ⍝ Now stack the derived fn
 →hard ⍝ EVERYONE is hard 1995-11-11
 →(~j[1;1]∊(E,'&'),E,'⍤')⍴hard ⍝ Not compose/rank
 ⍝ Compose/rank get attached to the verb.
 'Compose/rank under construction'assert j[1;1]∊E,'&'
 ⍝ Handle curry case. (No support for f&g).
 i←astclassGFN,astclassDFN,astclassMFN,astclassLFN
 b←j[0 2;2]∊i ⍝ Left vs right curry
 m←''⍴D b/j[0 2;1] ⍝ Affected ast row
 ast[m;b/astrarg,astlarg]←''⍴b/j[2 0;1]
 →ez
hard:Append2Ast astr
ez:i←((E state),(E m),E StV)Push state
