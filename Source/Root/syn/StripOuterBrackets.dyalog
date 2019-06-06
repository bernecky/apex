StripOuterBrackets←{
z←('{ ',NL)blanklis ,⍵
z←('} ',NL)blanktis z
(⍴⍵)⍴z
}

