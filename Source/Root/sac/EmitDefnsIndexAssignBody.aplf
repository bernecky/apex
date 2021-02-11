 r←mil EmitDefnsIndexAssignBody fns;cv;hdr;trlr;rks;ndx;nul;ndxp;rhs;p;k;lhs;eta
⍝# Emit body code indexed assign X[I0;I1...In]←Y[i0;i1...in]
 cv←mil≠0
 nul←cv∧mil=NULL ⍝ Mark elided indices
 trlr←(⍴mil)⍴((¯1+¯1↑⍴mil)⍴E''),E'=$YTto$ZT((Y'
 lhs←,(E'i'),¨⍕¨(⍴cv)⍴⍳¯1↑⍴cv
⍝
 rhs←lhs                          ⍝ The Y[...] part
 rhs[(~,cv)/⍳⍴rhs]←E''
 eta←EmitDefnsIndexAssignMarkElidedTrailingAxes mil
 rhs[eta/⍳⍴rhs]←E''               ⍝ Kill elided trailing axes
 k←,ScalarIndices fns
 rhs[k/⍳⍴k]←E''                   ⍝ No indexing on scalar indices
 rhs←Raze⍉','InsertInterAxisCommas(⍴cv)⍴rhs
 rhs←rhs Bracketize 0≠⍴¨rhs
⍝
 ndxp←LC¨lhs                       ⍝ The X[...] part
 rks←0 3↓D fns[;fnsranks]
 k←,ScalarIndices fns
 ndxp←(UC¨lhs),¨((E'[['),E'')[k],¨ndxp,¨((E']]'),E'')[k]
 ndxp[k/⍳⍴k]←UC¨k/lhs              ⍝ No for-loop on scalar indices
 lhs[eta/⍳⍴lhs]←E''                ⍝ Kill trail'g elided indices
 lhs[eta/⍳⍴ndxp]←E''
 lhs[(,~nul)/⍳⍴lhs]←(,~nul)/ndxp
 lhs[(~,cv)/⍳⍴lhs]←E''
 lhs←','InsertInterAxisCommas(⍴cv)⍴lhs
 lhs←(E'[['),lhs,E']]'
⍝
⍝ Handle scalar extension of Y
 hdr←(E'z'),mcb lhs
 rks←'0'=(D fns[;fnsranks])[;fnstypesrarg] ⍝ Mark scalar Y
 rhs[rks/⍳⍴rhs]←E''
 trlr←Raze⍉hdr,trlr,mcb rhs
 r←trlr,¨E'));',NL
