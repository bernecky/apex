﻿ r←x SSASearch yy;X;tar;yy2;S;yy3;yy4
 X←D x[0] ⋄ tar←D x[1] ⍝ bb #,target varb
⍝ yy[0] ⍝ SSA Stuff
 S←D yy[1] ⍝ S is rename stack.
⍝   yy[2]     is stack of new names
  ⍝ 1995-06-17. Algorithm changed to mark all
⍝ gens and stack them FIRST, then perform
⍝ renames of uses. This approach lets us work in
⍝ parallel within a basic block, whereas Wolfe's
⍝ algorithm assumes a ⍝ sequential pass
⍝ through the basic block.
⍝
⍝ (1) Replace gen V by Vi
 yy2←x SSASearchGen yy
 Checkem D yy2[0]
⍝ (2) Rename all non-PHI uses
 yy4←x SSASearchRenameNonPhi yy2
 Checkem D yy4[0]
⍝ (3) Rename PHI arguments of successors
 yy3←x SSASearchRenamePhiArguments yy4
 Checkem D yy3[0]
⍝ (4) ⍝ Rename in DOM children
 yy2←x SSASearchRenameDomChildren yy3
 Checkem D yy2[0]
 r←yy2
 r[1]←E S
