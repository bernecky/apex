﻿ r←ControlStructuresDyalog
 ⍝ List Dyalog ctl structure keywords
 r←(E':if'),E':endif'
 r←r,(E':else'),(E':elseif'),(E':andif'),(E':orif')
 r←r,(E':for'),(E':endfor'),(E':in')
 r←r,(E':while'),(E':endwhile')
 r←r,(E':until'),(E':repeat'),(E':endrepeat')
 r←r,(E':case'),(E':endcase'),(E':caselist'),(E':endcaselist')

