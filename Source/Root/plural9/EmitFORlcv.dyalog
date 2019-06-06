﻿ r←ast EmitFORlcv y;phialpha;phiomega;phiz;pf;forz;forin;pv;m;f;innm;itctrs;itctrsz;forlcv;fil;i;philarg;phirarg;tc;ve;rk;typeint
 ⍝ Emit initialization code for :For loops in Dyalog APL
 j←D y[0] ⋄ itctrs←D y[1]
 innm←D y[2]
 itctrsz←D y[3]
 ⍝
 ⍝ 1996-04-05
 ⍝ Treatment of :PHI of :For argument within loop:
 ⍝ Assume z←⍺ :PHI ⍵
 ⍝ a. "for initial" value is:  ⍵ := ⍺
 ⍝ b. Result of FOR is z. E.g., "z := for i in..."
 ⍝ c. Ref before set value in loop body is "old ⍵"
 ⍝ d. Last set within loop body is ⍵ (Done by ssa)
 ⍝ e. Returns clause value is: "value of ⍵"
 ⍝
 ⍝ Locate PHI funtions at front of each :For loop
 ⍝ Note 10k line assumption on max src pgm size in zi3 above.
 typeint←Types⍳'i'
 f←itctrs,¨mm E'= 0;'
 f←f,(E NL),itctrsz,E' = (shape('
 f←f,innm,E')[[0]])-1;',NL
 m←ast[;astfn]∊E':PHI'
 pf←(1,¯1↓j)pandscan m∨ast[;astfn]∊NULL
 pf←pf∧m ⍝ PHIs, NULLs interspersed.
 phiz←ast TargetName ast FindReferent pf/⍳⍴pf ⍝ Phi result
 ⍝
 ⍝ Get initial value and loop-carried value names
 philarg←D(pf⌿ast)[;astlarg] ⍝ Initial value of :PHI
 phirarg←D(pf⌿ast)[;astrarg]
 phialpha←ast FindReferent philarg
 phialpha←ast TargetName phialpha
 phiomega←ast FindReferent phirarg
 phiomega←ast TargetName phiomega
 :If 1∊m
  ⍝
  ⍝ If initial value is value error, replace it with
  ⍝ appropriate fill for the value. Scalars only.
     ve←D'?'membereach phialpha ⍝ Mark value errors
     fil←ast[D(pf\ve)⌿ast[;astrarg];asttype]
 ⍝⍝⍝ rk←ast[D(pf\ve)⌿ast[;astrarg];astrank]
     phialpha[ve/⍳⍴ve]←GetFill fil
  ⍝ I think the following is to handle type promotion
  ⍝ of loop-carried variables, such as in i←0 ... i←i+1.
  ⍝ rbe 2004-07-04
     m←(E'=to'),¨(mcb TypesBig[D ast[phirarg;asttype]]),¨'('
     m←m,¨mcb phialpha,¨')'
     m←,(mcb phiomega),¨m,¨E';',NL
  ⍝
  ⍝ Now package up initial values for each :For
  ⍝ (May have different # of them per :For)
     pv←1↓(1,¯1↓j)pplusreduce pf ⍝ #phi fns/for loop
     pv←D Raze pv↑¨1
     m←D¨Raze¨pv PartitionedEnclose m
     phiz←pv PartitionedEnclose phiz catenateeach','
     phiz←¯1 dropeach D Raze¨phiz
     phiomega←pv PartitionedEnclose phiomega
     phiomega←ast FORReorder phiomega
  ⍝f←phiz,f ⍝ phiz is the result of the loop in sisal - fix for sac.
     f←Raze⍉f,m
 :EndIf
 r←(E f),E phiomega
