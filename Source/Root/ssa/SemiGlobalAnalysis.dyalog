 r←ctx SemiGlobalAnalysis cds;mysg;fns;ct;callsme;j;SGMaps;i;AllVarbs;MapSGI;MapSGO;ast
⍝ Locate and mark semiglobals
⍝ 3 flavors:
⍝  SGI: semi-global in:  this fn or a sub-fn references this non-local
⍝  SGO: semi-global out: this fn or a sub-fn sets this non-local
⍝  SGIO: semi-global in/out: both of the above
 cds←SGSystemVars¨cds
 SGMaps←ctx SemiGlobalAnalysis2 cds
 AllVarbs←D SGMaps[0]
 MapSGI←D SGMaps[2]
 MapSGO←D SGMaps[3]
⍝ This works in several parts:
⍝ This part works from calling tree leaf to root,
⍝ marking any variable that is not local as astscopeSGI+astscopeSGO.
⍝ For non-leaf fns, missing variables (semiglobal to a sub-fn, but
⍝ not referenced/set in this fn) are added as astscopeSGI+astscopeSGO,
⍝ as are referenced/set non-locals.
⍝ Locals are left as locals.
⍝ After SSA is performed, these scopes are trimmed, so that:
⍝  - system vars that are not needed disappear
⍝  - erronenous semi-globals (set in sub-fn, but not used
⍝    after that) are marked as local in the sub-fn.
⍝  - semi-globals that are set in the sub-fn, but overwritten
⍝    in a caller without being used, are marked local in the sub-fn.
⍝⍝⍝⍝cds←InitializeSemiGlobals¨cds ⍝ Mark own semi-globals
⍝ Now walk the calling tree from leaves to root,
⍝ percolating semi-globals upwards to their localization point.
 fns←D ctx[0]
 ct←D ctx[1]
 :For i :In ⍳⍴cds
     ast←D(D cds[i])[ssaast]
     callsme←(×ct[;i])/⍳⍴fns⍝ Who calls me
 ⍝ Create new ast rows w/proper scope
     mysg←astNewRows+/MapSGI[;i]∨MapSGO[;i]
     mysg[;asttarget]←(MapSGI[;i]∨MapSGO[;i])/AllVarbs
     j←mysg[;asttarget]⍳MapSGO[;i]/AllVarbs
     mysg[j;astscope]←mysg[j;astscope]+astscopeSGO
     j←mysg[;asttarget]⍳MapSGI[;i]/AllVarbs
     mysg[j;astscope]←mysg[j;astscope]+astscopeSGI
     cds[callsme]←(E mysg)SemiGlobalMerge¨cds[callsme]
 :EndFor
 ⍝ Amend calls to include semiglobals in and out
 cds←(E(E ctx),E cds)SemiGlobalSGIparms¨⍳⍴cds
 'After SemiGlobalSGIparms'TraceSG cds
 cds←(E(E ctx),E cds)SemiGlobalSGOparms¨⍳⍴cds
 'After SemiGlobalSGOparms'TraceSG cds
 ((E MapSGI+MapSGO),(E fns),E AllVarbs)CheckSGIO cds
 cds←AppendRE¨cds
 cds←SemiGlobalSGOCopy¨cds
 r←Tagast¨cds
