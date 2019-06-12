 snfC;i;j;k;astr
 ⍝ Function to left of naked conjunction
 PushCursor Psuh state  ⍝ Push function onto stack, same state
 j←c gett(E src),E tok ⍝ Peek at token left of fn
 ⍝ If the token after the fn is a conjunction, we
 ⍝ have something like: +.×.×
 'Derived fn composition: Under construction'assert~j[0]∊clsconj ⍝ +.×.×
 ⍝ It's code written by a human. Emit the derived fn
 astr←,astNewRows 1
 astr[asttarget]←E astp
 astr[astlop]←i[0]
 k←stkpop 2 ⍝ Get conjunction and rop
 astr[astfn,astrop]←k[;1]
 astr[astclass]←astclassLFN ⍝ Derived fn
 Append2Ast astr
 i←((E state),(E astp-1),E astclassLFN)Push StV
 ⍝ Now just normal derived verb on stack
