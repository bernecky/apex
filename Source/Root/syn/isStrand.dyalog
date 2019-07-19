isStrand←{
 ⍝ Check for Strand on stk
 sz←')'StackCheck⍳⍺ 
 ⍝ (id) or (id id id) or (id n id) or ( id n (2+3))...
 (sz≥1) ∧ ∧/⍵[¯1+⍺-⍳sz;Stktokcl]∊clsid,clsnum,clsexpn 
}

