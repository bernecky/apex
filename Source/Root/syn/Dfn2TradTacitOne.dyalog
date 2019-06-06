 Dfn2TradTacitOne←{
⍝ ⍵ is (all fn names, this Dfn Function name)
⍝ ⍺ is the function body of this Dfn: { ... }, with no nested fns inside
⍝ Or maybe, it's a TradFn already
⍝ Result is the TradFn form of ⍺
     (fnm fns)←⍵
     t←dbr StripOuterBrackets ⍺
     lcls←fns DfnLocals t ⍝ Get variable names for localization
     (t nma nmo)←DfnAlphaOmega t ⍝ Rename our ⍺ and ⍵

⍝⍝⍝ KLUDGE: RESULT IS ALWAYS Z
⍝⍝⍝nmz←D TempName E'Res'

⍝ Fn header for new inner Tradfn
     t←dbr UnDiamondize DeleteComments t ⍝ Avoid "Z←⍝ foo"
     nmz←'Z'
     z←nmz,'←',nma,' ',fnm,' ',nmo,,D Raze';',¨lcls
     ⍝ Append result assign to last non-comment line
     ⍝ which had better contain Z, with assign
     t←(¯1↓t)rcat nmz,'←',¯1↑t
     (isDfn ⍺)⌷⍺(z rcat t)
 }
