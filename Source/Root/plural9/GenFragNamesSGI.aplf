 r←GenFragNamesSGI y;cal;ast;cv;mil;nms;com
⍝ Modify invocation of subfns called from here
⍝ to include semiglobals into the subfn from here.
 cal←D y[0]
 ast←D y[1]
 cv←(dfainit ast)∧~ast[;astparms]∊NULL ⍝ Mark semiglobals into subfns
 cv←cv∧~ast[;astfn]∊(E':GI'),E':GO'
 cv←cv/⍳⍴cv
 :If 0≠⍴cv
     mil←(E ast)SGList¨ast[cv;astparms] ⍝ Get all lists
     nms←(E ast)TargetName¨mil ⍝ Names of semiglobals
     com←((E''),E',')[,D 0≠⍴¨cal[cv;calrarg]]
     nms←1↓¨AddCommas¨nms ⍝ Commas between multiple GIs
     nms←com,¨nms ⍝ Commas between formal args and GIs
     nms←D¨Raze¨nms
     cal[cv;calrpar]←nms,¨cal[cv;calrpar]
 :EndIf
 r←cal
