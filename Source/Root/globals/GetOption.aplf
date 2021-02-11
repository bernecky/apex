GetOption←{ ⍝ Get option ⍵ from ⍺
 ⍝ ⍺ is user-supplied option list, blank-delimited
 ⍝ e.g., "OutputLanguage=plural debugdfa=1"
 ⍝ ⍵ is, e.g.,  "OptionName=DefaultValue"
 ⍝ or "OptionName="  default value will be empty vector 
 ⍝ or "OptionName"   error if OptionName=x not in ⍺
 Oname←(1+⍵⍳'=')↑⍵ 
 opts←' ',dlb dtb ⍺,' ',⍵
 optm←' ' vtom opts
 b←Oname≡⍤1⊢(⍴Oname)↑⍤1⊢optm ⍝  Mark all desired opts
 loc←⌈/b/⍳⍴b ⍝ Last desired opt
 dtb(⍴Oname)↓loc⌷optm
}


