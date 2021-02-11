 r←ast EmitFnCallsIndexY cv;cv2;rnk
⍝# Find right arguments to indexed assigns
⍝# Get argument ranks, too.
 r←cv⌿ast[;astrop]
 rnk←,D ast[r;astrank]
 cv2←r≠NULL
 r←cv2\ast TargetName ast FindReferent(cv\cv2)⌿ast[;astrop]
 r←(E r),E rnk
