 sngn;v;astr;i
 ⍝ Naked right arrow left of start of stmt
 ⍝ Verify that nothing left of arrow, except maybe
 ⍝ white space and stmt label.
 ⍝ NB. Today, we only do the whitespace thing.
 ⍝ NB. Label will cause false failure here
 i←c gett(E src),E tok ⍝ Get the →
 PushCursor i
 v←c gett(E src),E tok ⍝ What's after the →?
 :If clsspace=D v[GettClass] ⍝ Kill any whitespace
     PushCursor v
 :EndIf
 'source program syntax error: GOTO not root function'assert ¯1=c
 ⍝ Emit the naked arrow.
 astr←astNewRows 1
 astr[;astfn]←c[0] ⋄ astr[;astclass]←astclassVARB
 pushast astr
 ∘
