 r←cv EmitAssignment y;coer;b;i;typ;cl;ast;cal;nops
⍝ Emit all assignments (not indexed assign...) for cv⌿cal,
⍝ and the coercions for the assigns. Coercions are
⍝ needed for assigns to system variables, and for
⍝ assigns of loop-carried variables, such as:
⍝       i←0
⍝ loop: i←i+1
⍝ The loop-carried value is integer, but the initial
⍝ value is Boolean. R. Bernecky 2004-06-20
 :If (2=⍴⍴y) ⍝DEBUG KLUDGE!!!
     ÷0
 :Else
     ast←D y[0]
     cal←D y[1]
     r←cal
     cv←~astNops ast           ⍝ DEBUG KLUDGE!!!
     :If 1∊cv   ⍝ Stupid APL2 prototypes
         typ←ast[cv/ast[;asttarget];asttype] ⍝ Target type, if any
         :If TargetLanguage≡'sisal'
             r←(E':='),¨cal÷0 ⍝ Fix SISAL some other day 2004-07-03
         :ElseIf TargetLanguage≡'sac'
⍝ Coercions
⍝ Since APL is (hohoho) untyped, these should not
⍝ be needed. However, system variables are typed,
⍝ at least in the APEX world, so we perform coercion
⍝ at assign time, rather than at reference time, which
⍝ otherwise make things messy(messier?). rbe 2004-07-04
⍝
⍝ The idea is: If the target has a type already, and
⍝ the source has a different type, we coerce
⍝ to that type. Otherwise, we assign with no coercion.
⍝
             cal[cv/⍳⍴cv;caltarget]←cal[cv/⍳⍴cv;caltarget],¨E'=' ⍝ All assigns
             b←(typ≠NULL)∧cv/∨\ast[;asttarget]∊aststz
             b←b∧typ≠cv⌿ast[;asttype] ⍝ Source, target types differ
             coer←(E'to'),¨((' ',TypesBig)[1+b/typ]),¨'('
             b←(cv\b)/⍳⍴cv
             cal[b;caltarget]←cal[b;caltarget],¨coer
             cal[b;calrparcoer]←E,')'
             r←cal
             r[;calsemicolon]←⍪(ER1 2 2⍴'  ;',NL)[cv]
         :EndIf
     :EndIf
 :EndIf
