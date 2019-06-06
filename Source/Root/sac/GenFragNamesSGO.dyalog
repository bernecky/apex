 r←GenFragNamesSGO y;cal;ast;ptr;lst;tar;sz
⍝ Modify invocation of subfns called from here
⍝ to include semiglobals from the subfn to here.
 cal←D y[0]
 ast←D y[1]
 ptr←(dfainit ast)∧~ast[;astImplicitResult]∊NULL
 ptr←ptr/⍳⍴ptr              ⍝ The fn calls of interest
 :If ~0∊⍴ptr ⍝ Any work?
     lst←(E ast)IndexList¨ptr,¨astImplicitResult
     sz←,D Raze⍴¨lst               ⍝ # of SGs/call
     lst←ast[D Raze lst;asttarget] ⍝ The SGs
     tar←(E ast)TargetName¨lst ⍝ The real semiglobals
     tar←(D Raze sz↑¨1)PartitionedEnclose(E','),¨tar
     tar←D¨Raze¨tar
     cal[ptr;caltarget]←cal[ptr;caltarget],¨tar
 :EndIf
 r←cal
