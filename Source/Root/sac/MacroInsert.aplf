 r←mac MacroInsert frag;cv
 ⍝ Macro Inserter.
 ⍝ Find macro mac in frag. Remove macro name
 ⍝ and matching curly braces.
 cv←mac MacroLocate frag
 →(0=∨/cv)⍴lz ⍝ No work
 frag[(cv⍳1)+⍳1+⍴mac]←' ' ⍝ Kill macname{
 frag[1↓(cv≠1⌽cv)/⍳⍴cv]←' ' ⍝ Kill training }
lz:r←frag
