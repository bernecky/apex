 r←StackPop n
 ⍝ Pop top n elements from stk.
 r←stk[(stkp-1)-⍳n;]
 stkp←stkp-n

