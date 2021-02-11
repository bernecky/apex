 snfC;i;j;k;astr;row
 ⍝ Function to left of naked conjunction
 PushCursor Push state  ⍝ Push function onto stack, same state
 j←c gett(E src),E tok ⍝ Peek at token left of fn
 ⍝ If the token after the fn is a conjunction, we
 ⍝ have something like: +.×.×
 'Derived fn composition: Under construction'assert~j[0]∊clsconj ⍝ +.×.×
 ⍝ It's code written by a human. Emit the derived fn
 astr←,astNewRows 1
 row←≢ast
 astr[asttarget]←E row
 astr[astlop]←i[0]
 k←StackPop 2 ⍝ Get conjunction and rop
 astr[astfn,astrop]←k[;1]
 astr[astclass]←astclassLFN ⍝ Derived fn
 ast←ast append2Ast astr
 i←((E state),(E row),E astclassLFN)Push StV
 ⍝ Now just normal derived verb on stack
