 indices←vector stringfind substring;l;r
 ⍝ returns the index of the beginning of each occurrence of <substring> in <vector>.  ⎕io-responsive.
 indices←(substring⍷vector)/⍳⍴vector
 →0
 ⍝ (sauce/stringfind.2 from the sharp apl utility library)
 vector←,vector
 r←×/⍴substring
 l←0⌈(⍴vector)-r-1
 indices←((r=0)∨(l↑vector∊1↑substring)∧(-l)↑vector∊¯1↑substring)/⍳l
 indices←(vector[indices∘.+(⍳0⌈r-2)+~⎕IO]∧.=1↓¯1↓substring)/indices
