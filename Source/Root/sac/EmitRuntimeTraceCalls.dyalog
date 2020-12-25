 r←EmitRuntimeTraceCalls y;cal;ast;cv;marktemps;vars
 ast←D y[0]
 cal←D y[1]
 marktemps←(dfainit ast)⍳1            ⍝ Sheep vs goats
 :If #.globals.DisplayTemps 
     cv←~astNops ast
     cv←cv\(,D cv⌿ast[;asttarget])>marktemps ⍝ Temp names
     vars←ast TargetName cv⌿ast[;asttarget]
     vars←ast GenerateTraceStatements(E cv),E vars
     cal[cv/⍳⍴cv;caltrace]←cal[cv/⍳⍴cv;caltrace],¨vars
 :EndIf
 :If #.globals.DisplayVars 
     cv←~astNops ast
     cv←cv\(,D cv⌿ast[;asttarget])<marktemps   ⍝ Non-temp names
     vars←ast TargetName cv⌿ast[;asttarget]
     vars←ast GenerateTraceStatements(E cv),E vars
     cal[cv/⍳⍴cv;caltrace]←cal[cv/⍳⍴cv;caltrace],¨vars
 :EndIf
 r←cal
