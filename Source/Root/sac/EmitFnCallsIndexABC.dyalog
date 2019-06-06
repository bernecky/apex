﻿ r←cal EmitFnCallsIndexABC y;ast;mil;i;cv;mili;expn;nmI;nmX;nmT;ni;axis;dmil;cv;qio
⍝# Generate array-bounds checks for indexed ref and indexed assign
 ast←D y[0]
 mil←D y[1]            ⍝ Index lists I
 i←D y[2]            ⍝ cv for index expns X
 dmil←D(E ast)IndexAstLarg¨mil
 ni←~dmil∊NULL,0         ⍝ live indices per index expn
 cv←0≠+/ni               ⍝ #non-null indices for this op
 axis←⍕¨(,ni)/(×/⍴dmil)⍴⍳¯1↑⍴dmil ⍝ Axis #s
 mili←(,ni)/,D mil
⍝ Construct "= ABC(toi(I)-QUADio_42,shape(X)[Iaxis]);"
 nmI←ast[mili;astlarg] ⍝ Index array temp names
 nmI←ast TargetName ast FindReferent nmI
 nmX←(+/ni)/ast TargetName ast[D(i⌿ast[;astlarg]);asttarget]
 qio←(+/ni)/ast TargetName ast[D(i⌿ast[;astparms]);astrarg]
 r←cal
 :If ~0∊⍴nmX                      ⍝ Any work?
     expn←nmX,¨(E')['),¨axis,¨E']);',NL
     expn←nmI,¨(E')-'),¨qio,¨(E',shape('),¨expn
     expn←(E'= ABC(toi('),¨expn
     expn←(ast TargetName mili),¨expn
     ni←(0≠+/ni)⌿ni                  ⍝ Group expns by index op
     expn←(D Raze(+/ni)↑¨1)PartitionedEnclose expn
     expn←D¨Raze¨expn
     j←(i\cv)/⍳⍴i                    ⍝ Non-null op indices
     r[j;calindxerr]←expn            ⍝ Temp index names
 :EndIf
