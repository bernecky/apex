 r←st stlookup nm
 ⍝ Look up boxed name in symbol table
 r←st[;stname]⍳nm
 :If r=1↑⍴st  ⍝ If name isn't in symbol table, result is name
     r←nm
 :EndIf
