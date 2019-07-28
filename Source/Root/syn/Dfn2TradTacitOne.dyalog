 Dfn2TradTacitOne←{
⍝ ⍵ is (all fn names, this Dfn Function name)
⍝ ⍺ is the function body of this Dfn: { ... }, with no nested fns inside
⍝ Or maybe, it's a TradFn already
⍝ Result is the TradFn form of ⍺
     (fnm fns)←⍵
     t←dbr StripOuterBrackets ⍺
     lcls←fns DfnLocals t ⍝ Get variable names for localization
     (t nma nmo)←DfnAlphaOmega t ⍝ Rename our ⍺ and ⍵

⍝ Fn header for new inner Tradfn
     t←dbr UnDiamondize DeleteComments t ⍝ Avoid "Z←⍝ foo"
     ⍝ If last line is apparently a strand (I.e., it begins with '(' )
     ⍝ We make the strand itself the result.
     isstrnd←'('=1↑dlb,¯1↑t
     nmz←D isstrnd⌷(E,'Z'),E,¯1↑t
     z←nmz,'←',nma,' ',fnm,' ',nmo,,D Raze';',¨lcls
     ⍝ Append result assign to last non-comment line
     ⍝ which had better contain Z, with assign
     z←z rcat(¯1↓t)rcat(~isstrnd)/nmz,'←',,¯1↑t
     (isDfn ⍺)⌷⍺ z
 }
