 (outerfn innerfns fns)←Dfn2TradTacit(outerfn innerfns fnm fns);cv;t;ifnm;nfns;dfns;newfn
⍝ outerfn may be a TradFn already, or
⍝ dfn is the function body of this Dfn: { ... }
⍝ It may contain inner Dfns
⍝ newfns is a list of inner TradFns generated from dfn
⍝ fns is a list of the names of those generated TradFns
⍝ This verb operates innermost to outermost, as it
⍝ avoids us having to deal with nested ⍵ and ⍺.
     ⍝ Append a diamond to end of each line, in case an
     ⍝ inner Dfn spans more than one line
 dfns←StripOuterBrackets outerfn
 cv←MarkFirstInnerDfn dfns
 :If 1∊cv ⍝ Need new local fn?
     ifnm←fnm,(1≠1↑cv)/'_',⍕cv⍳1 ⍝ Unique name
     t←dbr vtom NL,(((cv⍳1)↓cv)⍳0)↑(cv⍳1)↓,dfns
     newfn←t Dfn2TradTacitOne(ifnm fns)
     innerfns←innerfns,newfn
     outerfn←cv Dfn2TradReplaceDfn(outerfn ifnm)
     fns←nub fns,E ifnm
     :if 1∊MarkFirstInnerDfn outerfn ⍝ Handle any other local fns
       (outerfn innerfns fns)← Dfn2TradTacit(outerfn innerfns fnm fns)
     :endif 
 :EndIf

