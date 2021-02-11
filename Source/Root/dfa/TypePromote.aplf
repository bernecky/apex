 r←nast TypePromote oast;b;nt;ot
⍝ Check type promotion troubles
⍝ If new type≠old type, and both not NULL,
⍝ give warning. and ignore set
 r←nast
 nt←D nast[;asttype]
 ot←D oast[;asttype]
 b←(~nt∊NULL)∧(~ot∊NULL)∧ot>nt
 b←b∨(nt∊NULL)∧~ot∊NULL ⍝ Don't set back to NULL
 r[b/⍳⍴b;asttype]←b/ot ⍝ Ignore some sets maybe
 b←b∧'⎕'≠1↑¨nast[;asttarget] ⍝ Ignore ⎕pp, ⎕pw, etc.
 :If 1∊b
     ÷0
     ⎕←'Warning: Type demotion ignored'
     ⎕←'old:'
     ⎕←b⌿oast
     ⎕←'new:'
     ⎕←b⌿nast
 :EndIf
