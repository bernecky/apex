 r←cv TakeDropSpecialCases ast;lh;p;b;case;val;cv2;sign
⍝ Find special cases for take and drop
⍝ We look for the following:
⍝
⍝ Left argument elements of:
⍝ 0:   p0
⍝ 1:   p1
⍝ ¯1:  n1
⍝ n≥0: pi
⍝ n<0: ni
⍝ This is all garbage for SAC. Or so I think. 2004-08-15 rbe
 r←(⍴cv)⍴E'' ⍝ No special cases.
 →lz
⍝
⍝
 val←(E 0),(E 1),(E ¯1),(E 0 0),(E 0 1),(E 1 0),(E 1 1)
 val←val,(E,0),(E,1),E ¯1 ⍝ Confusion on the rank
⍝ of values contained in astvalue. (Is a scalar
⍝ represented as scalar or vector?) FIX LATER! 1996-05-05
 val←val,(E ¯1 0),(E ¯1 1),(E ¯1 ¯1),(E 0 ¯1),(E 1 ¯1)
 case←((E ¯1 0 1)⍳¨val)⊃¨¨E E(E'n1'),(E'p0'),E'p1'
 case←D¨Raze¨case
 r←(⍴cv)⍴E'' ⍝ Assume no special case
 lh←D cv⌿ast[;astlarg] ⍝ x in x↑y or x↓y
⍝
 p←(D ast[;astPred])[lh;] ⍝ Morphological predicates of x
 b←val⍳ast[lh;astvalue] ⍝ Our special case?
 cv2←p[;astPredKnowValue]∧b<⍴val ⍝ Got some values?
 r[(cv\cv2)/⍳⍴cv]←case[cv2/b] ⍝ Mark them appropriately
 cv←cv\~cv2 ⍝ Ignore found objects
 lh←(~cv2)/lh
⍝
⍝ We have done all we can for specific constants
⍝
⍝ Check numeric signs by element if we know value
 b←ast[lh;asttype]∊asttypeB,asttypeI,asttypeD
 b←b∧ast KnowValue lh
 cv←cv\b
 lh←b/lh
 b←val⍳×quadfi¨ast[lh;astvalue] ⍝ Signum
 cv2←(D ast[;astPred])[lh;astPredKnowValue]
 cv2←cv2∧b<⍴val
 case←((E ¯1 0 1)⍳¨val)⊃¨¨E E(E'ni'),(E'p0'),E'pi'
 r[(cv\cv2)/⍳⍴cv]←case[cv2/b] ⍝ Mark them appropriately
 cv←cv\~cv2 ⍝ Ignore found objects
 lh←(~cv2)/lh
⍝
⍝ Our last resort is sign of entire array, which
⍝ we may know even if specific values are unknown.
⍝⍝b←p[;astPredNonNeg] ⍝ Our last resort
⍝⍝⍝r[(cv\b)/⍳⍴cv;]←(2×1⌈ast[b/lh;astrank])⍴¨E'pi'
⍝ Stupid code dies on empty. FIx later
 r←D¨Raze¨r
lz:
