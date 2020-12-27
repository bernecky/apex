 r←ctx SemiGlobalAnalysis2 cds;Refhere;Sethere;Localhere;AllVarbs;MapL;MapSet;MapRef;MapSGI;MapSGO;fns;ct;vars
⍝ Locate and mark semiglobals
⍝ 3 flavors:
⍝  SGI: semi-global in:  this fn or a sub-fn references this non-local
⍝  SGO: semi-global out: this fn or a sub-fn sets this non-local
⍝  SGIO: semi-global in/out: both of the above
 fns←D ctx[0]
 ct←D ctx[1]
⍝ This is intended to produce a conservative estimate of sgi and sgo.
⍝ I.e., it may declare vars sgi or sgo when they do not have any
⍝ sets or references. Once we are in SSA-land, this should be precise.
 vars←VarNamesAndScope¨cds
 Refhere←vars Ref¨cds            ⍝ The fn references this
 Sethere←vars Set¨cds            ⍝ The fn sets these
 Localhere←vars Local¨cds        ⍝ The fn localizes these
 AllVarbs←nub(D Raze⍉vars)[;0]
 MapL←⍉D(E AllVarbs)∊¨Localhere ⍝ Localization map
 MapSet←⍉D(E AllVarbs)∊¨Sethere
 MapRef←⍉D(E AllVarbs)∊¨Refhere
 MapSGI←MapL #.arrayutils.porscanM MapRef∧~MapL
 MapSGO←MapL #.arrayutils.porscanM MapSet∧~MapL
⍝seeem
 r←(E AllVarbs),(E MapL),(E MapSGI),E MapSGO
