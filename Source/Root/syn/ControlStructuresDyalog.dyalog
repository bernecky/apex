 r←ControlStructuresDyalog
 ⍝ List Dyalog ctl structure keywords
 ⍝ This is one of those stupid things where the interpreter INSISTS
 ⍝ on rewriting your code to suit their ideas of taste. Now, this
 ⍝ is completely incompatible with APL+Linux and friends, purely due
 ⍝ to CaPiTaliZaTiOn differences, as Hyman Kaplan would say.
 ⍝ So, we'll just capitalize the whole shebang.
 r←(E':IF'),E':ENDIF'
 r←r,(E':ELSE'),(E':ELSEIF'),(E':ANDIF'),(E':ORIF')
 r←r,(E':FOR'),(E':ENDFOR'),(E':IN')
 r←r,(E':WHILE'),(E':ENDWHILE')
 r←r,(E':UNTIL'),(E':REPEAT'),(E':ENDREPEAT'),(E':UNTIL')
 r←r,(E':CASE'),(E':ENDCASE'),(E':CASELIST'),(E':ENDCASELIST')
