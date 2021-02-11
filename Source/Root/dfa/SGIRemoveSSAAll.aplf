 r←x SGIRemoveSSAAll ast;cv;nms;cv2
⍝ Delete :GI ast entries from the fncalls at cv
 cv←D x[0]
 nms←D x[1]
 :While 1∊cv
     cv2←<\cv
     ast←((E cv2),E nms)SGIRemoveSSA ast
     cv←cv∧~cv2
 :EndWhile
 r←ast
