 snstscif;astr;j
 ⍝state is expression. signal is stsc :if
 ⍝ Fails to catch  syntax erros such as 2+:if...∘
 j←StackPop 1 ⍝ Pop the :if argument
 astr←,astNewRows 1 ⍝ Build ast entry
 astr[astfn]←E':If' ⍝ :if
 astr[astrarg]←j[0;1] ⍝ Argument to :if
 astr[astclass]←astclassCTL
 ast←ast append2Ast astr
