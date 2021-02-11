 r←st stlookup nm
 ⍝ Look up boxed name in symbol table
 r←st[;stname]⍳nm
 :If r=1↑⍴st  ⍝ If name is not in symbol table, result is name
     ⍝ E.g., a system function. Beware sysvars!
     r←nm
 :EndIf
