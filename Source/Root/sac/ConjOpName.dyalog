﻿ r←ast ConjOpName y;cv;astloprop;tar;cv3;cv2;fnm
⍝ Return operand names for ast rows.
⍝ This may be a jsym (e.g., "eq" for "="),
⍝ a constant (e.g., "01" for nuax 0 1),
⍝ or a defined fn name (e.g., foo in foo nuax goo).
 astloprop←D y[0]
 cv←D y[1]
 tar←cv⌿ast[;astloprop]           ⍝ ast entries for f or g
 cv3←~tar∊NULL
 tar←cv3/tar
 r←(+/cv)⍴E''
 :If 1∊cv3
     cv2←ast[tar;astclass]∊astclassVARB,astclassNC,astclassCC
     :If ~∧/cv2 ⍝ Stupid APL2 empty arrays
         fnm←D Raze(E ast)FunctionName¨ast[(~cv2)/tar;astfn]
         r[(~cv2)/⍳⍴cv2]←fnm
     :EndIf
 :EndIf
