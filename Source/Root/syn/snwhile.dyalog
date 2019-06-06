 snwhile;j;astr;i
 ⍝ state is expression. signal is stsc kwd
 ⍝ This is a :while expression.
 ⍝ Next token must be root of statement or label.
 :If c≠¯1
     i←c gett(E src),E tok ⍝ could be writespace
     'Source program syntax error'assert clsspace=D i[GettClass]
     PushCursor v
 :EndIf
 'Source program syntax error'assert c=¯1 ⍝ (:while not root)
 ⍝ Emit :while expression.
 j←stkpop 1 ⍝ Pop the :while argument
 astr←,astNewRows 1 ⍝ Build ast entry
 astr[asttarget]←E astp
 astr[astfn]←E':While'
 astr[astrarg]←j[0;1] ⍝ Argument to :while
 astr[astclass]←NULL
 astpush astr
