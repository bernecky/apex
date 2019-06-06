 r←cv tokenizeDyalog y;i;uy
 ⍝ Mark Dyalog ctl structure keywords
 ⍝ This is one of those stupid things where the interpreter INSISTS
 ⍝ on rewriting your code to suit their ideas of taste. Now, this
 ⍝ is completely incompatible with APL+Linux and friends, purely due
 ⍝ to CaPiTaliZaTiOn differences, as Hyman Kaplan would say.
 ⍝ So, we'll just capitalize the whole shebang.
 uy←UC y
 i←uy ssmark':IF'
 i←i∨uy ssmark':ENDIF'
 i←i∨uy ssmark':ELSE'
 i←i∨uy ssmark':ELSEIF'
 i←i∨uy ssmark':ANDIF'
 i←i∨uy ssmark':ORIF'
 i←i∨uy ssmark':FOR'
 i←i∨uy ssmark':ENDFOR'
 i←i∨uy ssmark':IN'
 i←i∨uy ssmark':WHILE'
 i←i∨uy ssmark':ENDWHILE'
 i←i∨uy ssmark':UNTIL'
 i←i∨uy ssmark':REPEAT'
 i←i∨uy ssmark':ENDREPEAT'
 i←i∨uy ssmark':CASE'
 i←i∨uy ssmark':ENDCASE'
 i←i∨uy ssmark':CASELIST'
 i←i∨uy ssmark':ENDCASELIST'
 'oops'assert i≡∨⌿D(E uy)ssmark¨ControlStructuresDyalog
 r←cv∧i
