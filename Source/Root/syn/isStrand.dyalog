isStrand←{
 ⍝ Check for Strand on stk
 sz←')'StackCheck⍳⍺ 
 ⍝ (id) or (id id id) or (id n id) or ( id n (2+3))...
 ⍝ if (id), just remove the parens, as that is not a real strand
 (sz≥2) ∧ ∧/⍵[¯1+⍺-⍳sz;Stktokcl]∊clsid,clsnum,clsexpn 
}

