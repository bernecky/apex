﻿ snkn;w;astr;j;v
 ⍝state is new stmt. signal is stsc kwd
 w←(c gett(E src),E tok)[0] ⍝ Get the keyword
 ⍝ Make sure kwd should be naked
 'Source program syntax erorr'assert w∊ControlStructuresDyalog
 ⍝ kwd must also be only token except for label
 c←c-⍴D w ⍝ Push past kwd
 :If c≠¯1 ⍝ and past any white space
     v←c gett(E src),E tok
     :If clsspace=D v[1]
         PushCursor v
     :EndIf
 :EndIf
 ⍝ NB. This should also push past : and label.
 ⍝ NB. label: :endif, etc will cause spurious error
 ⍝ NB. in next line
 'Source program syntax error or line label (verboten)'assert c=¯1
 ⍝ Emit the closing ctl marker
 astr←,astNewRows 1 ⍝ Build ast entry
 astr[astfn]←w ⍝ :endfor, etc
 j←(astclassVARB,NULL)[(D w)≡':endfor'] ⍝ noise
 astr[astclass]←j ⍝ keywords are varbs
 ⍝ Warning: :if may not be varb...
 ast←ast append2Ast astr
